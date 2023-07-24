select
    npl.event_date,
    npl.user_id,
    case when npl.vertical_id!=-1 then npl.vertical_id end as vertical_id,
    case when npl.logical_category_id!=-1 then npl.logical_category_id end as logical_category_id,
    npl.less_1_month,
    DATEDIFF('day', cu.RegistrationTime::date, npl.event_date) <= 30 as is_converted_less_30d,
    npl.is_asd,
    npl.asd_user_group_id,
    case when npl.user_segment!='Any' then npl.user_segment end as user_segment_market,
    npl.is_seller_vertical,
    npl.is_seller
from dma.new_pro_listers npl
left join dma.current_user cu on cu.user_id = npl.user_id
where event_date::date between :first_date and :last_date
