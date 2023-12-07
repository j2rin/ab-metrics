with am_client_day as (
select user_id,
       active_from_date,
       active_to_date,
       (personal_manager_team is not null and user_is_asd_recognised) as is_asd,
       user_group_id
from DMA.am_client_day_versioned
)
, user_segment_market as (
select 
    user_id, 
    logical_category_id, 
    user_segment, 
    cast(converting_date as timestamp(0)) + interval '86399' second as converting_date_ts,
    lead(cast(converting_date as timestamp(0)) + interval '86399' second, 1, cast('2099-01-01' as timestamp(0))) 
        over(partition by user_id, logical_category_id order by converting_date) as next_converting_date_ts
from dma.user_segment_market
where cast(converting_date as date) <= :last_date
)
select 	
		ctf.event_date ,  
		ctf.user_id ,                     
		ctf.cookie_id  ,                    
    	platform_id  ,                  
    	step,                           
    	user_flow   ,                   
    	configurator_from_page,         
    	ctf.vertical_id,                    
    	ctf.logical_category_id,        
        coalesce(acd.is_asd, False)                                       as is_asd,
        acd.user_group_id                                            as asd_user_group_id,
		coalesce(usm.user_segment, ls.segment, sid.user_segment_market) as user_segment_market
from dma.cpx_tariff_funnel ctf 
left join dict.segmentation_ranks ls 	
    on ctf.logical_category_id = ls.logical_category_id 
    and is_default
left join user_segment_market usm
    on  ctf.user_id = usm.user_id
    and ctf.logical_category_id = usm.logical_category_id
    and ctf.event_timestamp >= converting_date_ts and ctf.event_timestamp < next_converting_date_ts
left join (
    select user_id, user_segment_market, event_date
    from dma.sellers_info_day sid
    where cast(sid.event_date as date) between :first_date and :last_date
        -- and sid.event_month between date_trunc('month', :first_date) and date_trunc('month', :last_date) -- @trino
) sid on ctf.user_id = sid.user_id and ctf.event_date = sid.event_date
left join am_client_day acd
    on cast(ctf.event_timestamp as date) between acd.active_from_date and acd.active_to_date
    and ctf.user_id = acd.user_id
where cast(ctf.event_date as date) between :first_date and :last_date
    -- and ctf.event_year between date_trunc('year', :first_date) and date_trunc('year', :last_date) -- @trino
