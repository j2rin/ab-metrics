select event_date, platform_id, cookie_id, user_id, useragent_id, url_mask, success_requests, failed_requests
from dma.performance_requests_sli s
where cast(event_date as date) between :first_date and :last_date
    -- and event_month between date_trunc('month', :first_date) and date_trunc('month', :last_date) -- @trino
