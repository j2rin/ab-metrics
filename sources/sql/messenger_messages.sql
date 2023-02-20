select
 	mm.event_date::date,
 	mm.eventtype_id,
 	mm.chat_id,
	mm.platform_id,
    mm.from_user_id as user_id,
	0 as zero,
    mm.from_cookie_id,
    mm.message_id,
    mm.chat_item_id as item_id,
    mm.is_item_owner,
    mm.chat_type,
    mm.chat_subtype,
    mm.is_first_message,
	mm.chat_item_microcat_id as microcat_id,
	mm.chat_item_location_id as location_id,
	case
           when cb.chat_id is not null then true
		   else false
    end as is_chatbot_chat,
    case 
        when mm.from_user_id is null then null
        when cut.user_id is not null then true
        else false 
    end as IsTest,
	-- Dimensions -----------------------------------------------------------------------------------------------------
    cm.vertical_id,
	cm.category_id,
	cm.subcategory_id,
	cm.logical_category_id,
	cm.Param1_microcat_id                                        as param1_id,
	cm.Param2_microcat_id                                        as param2_id,
	cm.Param3_microcat_id                                        as param3_id,
	cm.Param4_microcat_id                                        as param4_id,
	decode(cl.level, 3, cl.ParentLocation_id, cl.Location_id)    as region_id,
	decode(cl.level, 3, cl.Location_id, null)                    as city_id,
	cl.LocationGroup_id                                          as location_group_id,
	cl.City_Population_Group                                     as population_group,
	cl.Logical_Level                                             as location_level_id,
	nvl(acd.is_asd, False)                                       as is_asd,
    acd.user_group_id                                            as asd_user_group_id,
    nvl(usm.user_segment, ls.segment)                            as user_segment_market
from DMA.messenger_messages mm
left join /*+jtype(h),distrib(l,a)*/ DMA.current_microcategories cm on cm.microcat_id = mm.chat_item_microcat_id
left join /*+jtype(h),distrib(l,b)*/ dict.segmentation_ranks ls on ls.logical_category_id = cm.logical_category_id and ls.is_default
left join /*+jtype(h),distrib(l,a)*/ DMA.current_locations cl ON cl.Location_id = mm.chat_item_location_id
left join (
    select
        user_id,
        active_from_date,
        active_to_date,
        (personal_manager_team is not null and user_is_asd_recognised) as is_asd,
        user_group_id
    from DMA.am_client_day_versioned
    where active_from_date <= :last_date
        and active_to_date >= :first_date
) acd
		on mm.from_user_id = acd.user_id
		and mm.event_date::date between acd.active_from_date and acd.active_to_date

left join /*distrib(l,a)*/ (
    select user_id from dma.current_user where isTest
) cut
    on cut.user_id = mm.from_user_id

left join /*distrib(l,a)*/ (
    select
        usm.user_id,
        usm.logical_category_id,
        usm.user_segment,
        usm.from_date,
        usm.to_date
    from (
        select
            user_id,
            logical_category_id,
            user_segment,
            converting_date as from_date,
            lead(converting_date, 1, '20990101') over(partition by user_id, logical_category_id order by converting_date) as to_date
        from DMA.user_segment_market
        where true
            and user_id in (
                select from_user_id
                from dma.messenger_messages
                where event_date::date between :first_date and :last_date
                    and from_user_id is not null
            )
            and converting_date <= :last_date::date
    ) usm
    where usm.to_date >= :first_date::date
) usm
    on  mm.from_user_id = usm.user_id
    and mm.event_date::date >= usm.from_date and mm.event_date::date < usm.to_date
    and cm.logical_category_id = usm.logical_category_id

left join /*distrib(l,a)*/ (
    select
        chat_id,
        start_flow_time,
        coalesce(end_flow_time, '9999-12-31'::timestamp) as _end_flow_time
    from DMA.messenger_chat_flow_report
    where start_flow_time::date <= :last_date
        and _end_flow_time >= :first_date
) cb
    on cb.chat_id = mm.chat_id
    and mm.event_date >=  cb.start_flow_time
    and mm.event_date <= cb._end_flow_time

where mm.event_date::date between :first_date and :last_date
    and not mm.is_spam
    and not mm.is_blocked
    and not mm.is_deleted
    and not mm.is_additional
