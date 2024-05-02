select cast(display_X as varchar(64)) as value
from dma.useragent_day
where event_year is not null
group by display_X
having sum(cnt_cookie) > 1000