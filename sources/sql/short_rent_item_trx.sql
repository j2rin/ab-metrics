with 
am_client_day as 
(
    select user_id,
           active_from_date,
           active_to_date,
           (personal_manager_team is not null and user_is_asd_recognised) as is_asd,
           user_group_id
    from DMA.am_client_day_versioned
),
item_data as
(
    select 
        ia.event_date,
        ia.user_id,
        ia.item_id,
        ia.platform_id,
        ia.location_id,
        cmc.vertical_id,
        cmc.logical_category_id,
        cmc.category_id,
        cmc.subcategory_id,
        isr.ShortTermRent,
        row_number() over(partition by ia.item_id, ia.event_date order by isr.actual_date desc) as rnb
    from dma.o_seller_item_active ia
    join dds.s_item_shorttermrent isr on isr.item_id = ia.item_id and ia.event_date >= cast(isr.actual_date as date)
    join dma.current_microcategories cmc on cmc.microcat_id = ia.microcat_id
    where cmc.logical_category_id = 1393250002 -- Realty.ShortRent
)
select 
    t.event_date,
    t.user_id,
    t.item_id,
    t.platform_id,
    t.vertical_id,
    t.logical_category_id,
    t.category_id,
    t.subcategory_id,
    ----
    case cl.level when 3 then cl.ParentLocation_id else cl.Location_id end as region_id,
    case when coalesce(acd.is_asd, False) then 1 else 0 end as is_asd,
    coalesce(usm.user_segment, ls.segment) as user_segment_market
from item_data as t
left join am_client_day as acd on acd.user_id = t.user_id and t.event_date between acd.active_from_date and acd.active_to_date
left join /*+jtype(h),distrib(l,r)*/ (
    select
        usm.user_id,
        usm.logical_category_id,
        usm.user_segment,
        c.event_date
    from (
        select
            user_id,
            logical_category_id,
            user_segment,
            converting_date as from_date,
            lead(converting_date, 1, cast('2099-01-01' as date)) over(partition by user_id, logical_category_id order by converting_date) as to_date
        from DMA.user_segment_market
        where true
            and converting_date <= :last_date
    ) usm
    join dict.calendar c on c.event_date between :first_date and :last_date
    where c.event_date >= usm.from_date and c.event_date < usm.to_date
        and usm.to_date >= :first_date
) usm
    on  t.user_id = usm.user_id
    and t.logical_category_id = usm.logical_category_id
    and t.event_date = usm.event_date
left join dict.segmentation_ranks ls on ls.logical_category_id = t.logical_category_id and ls.is_default
left join dma.current_locations cl on cl.Location_id = t.location_id
where rnb = 1 and ShortTermRent
and cast(t.event_date as date) between :first_date and :last_date
