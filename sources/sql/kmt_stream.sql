select
    t.event_date,
    t.platform_id,
    t.cookie_id,
    t.user_id,
    t.from_page,
    t.target_page,
    t.catalog_id,
    t.s_kmt,
    t.iv_kmt,
    t.c_kmt,
    t.iv_serp_kmt,
    t.c_serp_kmt,
    t.contacts_in_session,
    t.item_views_in_session,
    t.session_duration,
    t.first_event,
    t.Traffic_Source,
    t.url_mask,
    t.searches_in_session,
    cm.vertical_id,
    cm.logical_category_id,
    cm.category_id,
    cm.subcategory_id,
    cm.Param1_microcat_id   as param1_id,
    cm.Param2_microcat_id   as param2_id,
    cm.Param3_microcat_id   as param3_id,
    cm.Param4_microcat_id   as param4_id
from dma.kmt_stream t
left join /*+jtype(h),distrib(l,a)*/ DMA.current_microcategories cm on cm.microcat_id = t.microcat_id;
