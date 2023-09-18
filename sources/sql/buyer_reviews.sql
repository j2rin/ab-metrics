select
    cast(cbr.create_date as date) as event_date,
     rpc.platform_id,
     cbr.location_id,
     cm.vertical_id,
     cm.category_id,
     cm.subcategory_id,
     cm.logical_category_id,
    cm.microcat_id,
      rpc.cookie_id,
      cbr.from_user_id as user_id,
    cbr.to_user_id as buyer_id,
    reviewstatus,
      cbr.score,
      rpc.review_add_trigger,
      rpc.page_from,
      cbr.buyer_review_id,
     -- Dimensions -----------------------------------------------------------------------------------------------------
    cm.Param1_microcat_id                                        as param1_id,
    cm.Param2_microcat_id                                        as param2_id,
    cm.Param3_microcat_id                                        as param3_id,
    cm.Param4_microcat_id                                        as param4_id,
    case cl.level when 3 then cl.ParentLocation_id else cl.Location_id end as region_id,
    case cl.level when 3 then cl.Location_id end                           as city_id,
    cl.LocationGroup_id                                          as location_group_id,
    cl.City_Population_Group                                     as population_group,
    cl.Logical_Level                                             as location_level_id
from dma.current_buyer_reviews as cbr
left join /*+jtype(fm)*/ dma.review_buyer_params_clickstream  as rpc on cbr.buyer_review_external_id   = rpc.buyer_review_id
left join /*+jtype(h)*/  dma.current_microcategories    as cm  on cbr.microcat_id = cm.microcat_id
left join /*+jtype(h)*/  dma.current_locations          as cl  on cbr.Location_id = cl.location_id
where cast(cbr.create_date as date) between :first_date and :last_date