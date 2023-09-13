select platform_id, event_date, cookie_id,
    case when delay >= 0 and delay <= 10000 then delay end as delay,cast(
    (eid_4203 is not null and eid_4233 is not null) as int) as both_event,cast(
    (eid_4203 is not null and eid_4233 is null) as int) as only_click,cast(
    (eid_4203 is null and eid_4233 is not null) as int) as only_show
from (select
    platform_id, event_date, cookie_id,
    TIMESTAMPDIFF('ms',
        max(case when eid=4203 then event_time end),
        max(case when eid=4233 then event_time end))
    as delay,
    max(case when eid=4203 then 1 end) as eid_4203,
    max(case when eid=4233 then 1 end) as eid_4233
	from dma.story_delay
    where cast(event_date as date) between :first_date and :last_date
    group by 1,2,3
    )_

