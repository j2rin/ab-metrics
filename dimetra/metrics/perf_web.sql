create fact perf_web as
select
    t.cookie_id as cookie,
    t.cookie_id,
    t.duration,
    t.duration_events,
    t.events,
    t.events_p25,
    t.events_p50,
    t.events_p75,
    t.events_p95,
    t.initial_page_render,
    t.observation_date,
    t.stage_name
from dma.o_perf_web t
;

create metrics perf_web as
select
    sum(case when stage_name = 'app_cache' then duration end) as cnt_app_cache_duration,
    sum(case when stage_name = 'app_cache' then duration_events end) as cnt_app_cache_duration_events,
    sum(case when stage_name = 'app_cache' then events end) as cnt_app_cache_events,
    sum(case when stage_name = 'app_cache' then events_p25 end) as cnt_app_cache_events_p25,
    sum(case when stage_name = 'app_cache' then events_p50 end) as cnt_app_cache_events_p50,
    sum(case when stage_name = 'app_cache' then events_p75 end) as cnt_app_cache_events_p75,
    sum(case when stage_name = 'app_cache' then events_p95 end) as cnt_app_cache_events_p95,
    sum(case when stage_name = 'connection' then duration end) as cnt_connection_duration,
    sum(case when stage_name = 'connection' then duration_events end) as cnt_connection_duration_events,
    sum(case when stage_name = 'connection' then events end) as cnt_connection_events,
    sum(case when stage_name = 'connection' then events_p25 end) as cnt_connection_events_p25,
    sum(case when stage_name = 'connection' then events_p50 end) as cnt_connection_events_p50,
    sum(case when stage_name = 'connection' then events_p75 end) as cnt_connection_events_p75,
    sum(case when stage_name = 'connection' then events_p95 end) as cnt_connection_events_p95,
    sum(case when stage_name = 'content_paint_session' then duration end) as cnt_content_paint_session_duration,
    sum(case when stage_name = 'content_paint_session' then duration_events end) as cnt_content_paint_session_duration_events,
    sum(case when stage_name = 'content_paint_session' then events end) as cnt_content_paint_session_events,
    sum(case when stage_name = 'content_paint_session' then events_p25 end) as cnt_content_paint_session_events_p25,
    sum(case when stage_name = 'content_paint_session' then events_p50 end) as cnt_content_paint_session_events_p50,
    sum(case when stage_name = 'content_paint_session' then events_p75 end) as cnt_content_paint_session_events_p75,
    sum(case when stage_name = 'content_paint_session' then events_p95 end) as cnt_content_paint_session_events_p95,
    sum(case when stage_name = 'cumulative_layout_shift' then duration end) as cnt_cumulative_layout_shift_duration,
    sum(case when stage_name = 'cumulative_layout_shift' then duration_events end) as cnt_cumulative_layout_shift_duration_events,
    sum(case when stage_name = 'cumulative_layout_shift' then events end) as cnt_cumulative_layout_shift_events,
    sum(case when stage_name = 'cumulative_layout_shift' then events_p25 end) as cnt_cumulative_layout_shift_events_p25,
    sum(case when stage_name = 'cumulative_layout_shift' then events_p50 end) as cnt_cumulative_layout_shift_events_p50,
    sum(case when stage_name = 'cumulative_layout_shift' then events_p75 end) as cnt_cumulative_layout_shift_events_p75,
    sum(case when stage_name = 'cumulative_layout_shift' then events_p95 end) as cnt_cumulative_layout_shift_events_p95,
    sum(case when stage_name = 'cumulative_layout_shift_page' then duration end) as cnt_cumulative_layout_shift_page_duration,
    sum(case when stage_name = 'cumulative_layout_shift_page' then duration_events end) as cnt_cumulative_layout_shift_page_duration_events,
    sum(case when stage_name = 'cumulative_layout_shift_page' then events end) as cnt_cumulative_layout_shift_page_events,
    sum(case when stage_name = 'cumulative_layout_shift_page' then events_p25 end) as cnt_cumulative_layout_shift_page_events_p25,
    sum(case when stage_name = 'cumulative_layout_shift_page' then events_p50 end) as cnt_cumulative_layout_shift_page_events_p50,
    sum(case when stage_name = 'cumulative_layout_shift_page' then events_p75 end) as cnt_cumulative_layout_shift_page_events_p75,
    sum(case when stage_name = 'cumulative_layout_shift_page' then events_p95 end) as cnt_cumulative_layout_shift_page_events_p95,
    sum(case when stage_name = 'cumulative_layout_shift_webvital' then duration end) as cnt_cumulative_layout_shift_webvitals_duration,
    sum(case when stage_name = 'cumulative_layout_shift_webvital' then duration_events end) as cnt_cumulative_layout_shift_webvitals_duration_events,
    sum(case when stage_name = 'cumulative_layout_shift_webvital' then events end) as cnt_cumulative_layout_shift_webvitals_events,
    sum(case when stage_name = 'cumulative_layout_shift_webvital' then events_p25 end) as cnt_cumulative_layout_shift_webvitals_events_p25,
    sum(case when stage_name = 'cumulative_layout_shift_webvital' then events_p50 end) as cnt_cumulative_layout_shift_webvitals_events_p50,
    sum(case when stage_name = 'cumulative_layout_shift_webvital' then events_p75 end) as cnt_cumulative_layout_shift_webvitals_events_p75,
    sum(case when stage_name = 'cumulative_layout_shift_webvital' then events_p95 end) as cnt_cumulative_layout_shift_webvitals_events_p95,
    sum(case when stage_name = 'dom_completion' then duration end) as cnt_dom_completion_duration,
    sum(case when stage_name = 'dom_completion' then duration_events end) as cnt_dom_completion_duration_events,
    sum(case when stage_name = 'dom_completion' then events end) as cnt_dom_completion_events,
    sum(case when stage_name = 'dom_completion' then events_p25 end) as cnt_dom_completion_events_p25,
    sum(case when stage_name = 'dom_completion' then events_p50 end) as cnt_dom_completion_events_p50,
    sum(case when stage_name = 'dom_completion' then events_p75 end) as cnt_dom_completion_events_p75,
    sum(case when stage_name = 'dom_completion' then events_p95 end) as cnt_dom_completion_events_p95,
    sum(case when stage_name = 'dom_content_load' then duration end) as cnt_dom_content_load_duration,
    sum(case when stage_name = 'dom_content_load' then duration_events end) as cnt_dom_content_load_duration_events,
    sum(case when stage_name = 'dom_content_load' then events end) as cnt_dom_content_load_events,
    sum(case when stage_name = 'dom_content_load' then events_p25 end) as cnt_dom_content_load_events_p25,
    sum(case when stage_name = 'dom_content_load' then events_p50 end) as cnt_dom_content_load_events_p50,
    sum(case when stage_name = 'dom_content_load' then events_p75 end) as cnt_dom_content_load_events_p75,
    sum(case when stage_name = 'dom_content_load' then events_p95 end) as cnt_dom_content_load_events_p95,
    sum(case when stage_name = 'dom_interactive' then duration end) as cnt_dom_interactive_duration,
    sum(case when stage_name = 'dom_interactive' then duration_events end) as cnt_dom_interactive_duration_events,
    sum(case when stage_name = 'dom_interactive' then events end) as cnt_dom_interactive_events,
    sum(case when stage_name = 'dom_interactive' then events_p25 end) as cnt_dom_interactive_events_p25,
    sum(case when stage_name = 'dom_interactive' then events_p50 end) as cnt_dom_interactive_events_p50,
    sum(case when stage_name = 'dom_interactive' then events_p75 end) as cnt_dom_interactive_events_p75,
    sum(case when stage_name = 'dom_interactive' then events_p95 end) as cnt_dom_interactive_events_p95,
    sum(case when stage_name = 'dom_interactive_session' then duration end) as cnt_dom_interactive_session_duration,
    sum(case when stage_name = 'dom_interactive_session' then duration_events end) as cnt_dom_interactive_session_duration_events,
    sum(case when stage_name = 'dom_interactive_session' then events end) as cnt_dom_interactive_session_events,
    sum(case when stage_name = 'dom_interactive_session' then events_p25 end) as cnt_dom_interactive_session_events_p25,
    sum(case when stage_name = 'dom_interactive_session' then events_p50 end) as cnt_dom_interactive_session_events_p50,
    sum(case when stage_name = 'dom_interactive_session' then events_p75 end) as cnt_dom_interactive_session_events_p75,
    sum(case when stage_name = 'dom_interactive_session' then events_p95 end) as cnt_dom_interactive_session_events_p95,
    sum(case when stage_name = 'dom_load_session' then duration end) as cnt_dom_load_session_duration,
    sum(case when stage_name = 'dom_load_session' then duration_events end) as cnt_dom_load_session_duration_events,
    sum(case when stage_name = 'dom_load_session' then events end) as cnt_dom_load_session_events,
    sum(case when stage_name = 'dom_load_session' then events_p25 end) as cnt_dom_load_session_events_p25,
    sum(case when stage_name = 'dom_load_session' then events_p50 end) as cnt_dom_load_session_events_p50,
    sum(case when stage_name = 'dom_load_session' then events_p75 end) as cnt_dom_load_session_events_p75,
    sum(case when stage_name = 'dom_load_session' then events_p95 end) as cnt_dom_load_session_events_p95,
    sum(case when stage_name = 'domain_lookup' then duration end) as cnt_domain_lookup_duration,
    sum(case when stage_name = 'domain_lookup' then duration_events end) as cnt_domain_lookup_duration_events,
    sum(case when stage_name = 'domain_lookup' then events end) as cnt_domain_lookup_events,
    sum(case when stage_name = 'domain_lookup' then events_p25 end) as cnt_domain_lookup_events_p25,
    sum(case when stage_name = 'domain_lookup' then events_p50 end) as cnt_domain_lookup_events_p50,
    sum(case when stage_name = 'domain_lookup' then events_p75 end) as cnt_domain_lookup_events_p75,
    sum(case when stage_name = 'domain_lookup' then events_p95 end) as cnt_domain_lookup_events_p95,
    sum(case when stage_name = 'first_input_delay' then duration end) as cnt_first_input_delay_duration,
    sum(case when stage_name = 'first_input_delay' then duration_events end) as cnt_first_input_delay_duration_events,
    sum(case when stage_name = 'first_input_delay' then events end) as cnt_first_input_delay_events,
    sum(case when stage_name = 'first_input_delay' then events_p25 end) as cnt_first_input_delay_events_p25,
    sum(case when stage_name = 'first_input_delay' then events_p50 end) as cnt_first_input_delay_events_p50,
    sum(case when stage_name = 'first_input_delay' then events_p75 end) as cnt_first_input_delay_events_p75,
    sum(case when stage_name = 'first_input_delay' then events_p95 end) as cnt_first_input_delay_events_p95,
    sum(case when stage_name = 'first_paint_session' then duration end) as cnt_first_paint_session_duration,
    sum(case when stage_name = 'first_paint_session' then duration_events end) as cnt_first_paint_session_duration_events,
    sum(case when stage_name = 'first_paint_session' then events end) as cnt_first_paint_session_events,
    sum(case when stage_name = 'first_paint_session' then events_p25 end) as cnt_first_paint_session_events_p25,
    sum(case when stage_name = 'first_paint_session' then events_p50 end) as cnt_first_paint_session_events_p50,
    sum(case when stage_name = 'first_paint_session' then events_p75 end) as cnt_first_paint_session_events_p75,
    sum(case when stage_name = 'first_paint_session' then events_p95 end) as cnt_first_paint_session_events_p95,
    sum(case when stage_name = 'initial_page_render' then initial_page_render end) as cnt_initial_page_render,
    sum(case when stage_name = 'largest_contentful_paint' then duration end) as cnt_largest_contentful_paint_duration,
    sum(case when stage_name = 'largest_contentful_paint' then duration_events end) as cnt_largest_contentful_paint_duration_events,
    sum(case when stage_name = 'largest_contentful_paint' then events end) as cnt_largest_contentful_paint_events,
    sum(case when stage_name = 'largest_contentful_paint' then events_p25 end) as cnt_largest_contentful_paint_events_p25,
    sum(case when stage_name = 'largest_contentful_paint' then events_p50 end) as cnt_largest_contentful_paint_events_p50,
    sum(case when stage_name = 'largest_contentful_paint' then events_p75 end) as cnt_largest_contentful_paint_events_p75,
    sum(case when stage_name = 'largest_contentful_paint' then events_p95 end) as cnt_largest_contentful_paint_events_p95,
    sum(case when stage_name = 'on_load' then duration end) as cnt_on_load_duration,
    sum(case when stage_name = 'on_load' then duration_events end) as cnt_on_load_duration_events,
    sum(case when stage_name = 'on_load' then events end) as cnt_on_load_events,
    sum(case when stage_name = 'on_load' then events_p25 end) as cnt_on_load_events_p25,
    sum(case when stage_name = 'on_load' then events_p50 end) as cnt_on_load_events_p50,
    sum(case when stage_name = 'on_load' then events_p75 end) as cnt_on_load_events_p75,
    sum(case when stage_name = 'on_load' then events_p95 end) as cnt_on_load_events_p95,
    sum(case when stage_name = 'processing' then duration end) as cnt_processing_duration,
    sum(case when stage_name = 'processing' then duration_events end) as cnt_processing_duration_events,
    sum(case when stage_name = 'processing' then events end) as cnt_processing_events,
    sum(case when stage_name = 'processing' then events_p25 end) as cnt_processing_events_p25,
    sum(case when stage_name = 'processing' then events_p50 end) as cnt_processing_events_p50,
    sum(case when stage_name = 'processing' then events_p75 end) as cnt_processing_events_p75,
    sum(case when stage_name = 'processing' then events_p95 end) as cnt_processing_events_p95,
    sum(case when stage_name = 'processing_on_load' then duration end) as cnt_processing_on_load_duration,
    sum(case when stage_name = 'processing_on_load' then duration_events end) as cnt_processing_on_load_duration_events,
    sum(case when stage_name = 'processing_on_load' then events end) as cnt_processing_on_load_events,
    sum(case when stage_name = 'processing_on_load' then events_p25 end) as cnt_processing_on_load_events_p25,
    sum(case when stage_name = 'processing_on_load' then events_p50 end) as cnt_processing_on_load_events_p50,
    sum(case when stage_name = 'processing_on_load' then events_p75 end) as cnt_processing_on_load_events_p75,
    sum(case when stage_name = 'processing_on_load' then events_p95 end) as cnt_processing_on_load_events_p95,
    sum(case when stage_name = 'redirect' then duration end) as cnt_redirect_duration,
    sum(case when stage_name = 'redirect' then duration_events end) as cnt_redirect_duration_events,
    sum(case when stage_name = 'redirect' then events end) as cnt_redirect_events,
    sum(case when stage_name = 'redirect' then events_p25 end) as cnt_redirect_events_p25,
    sum(case when stage_name = 'redirect' then events_p50 end) as cnt_redirect_events_p50,
    sum(case when stage_name = 'redirect' then events_p75 end) as cnt_redirect_events_p75,
    sum(case when stage_name = 'redirect' then events_p95 end) as cnt_redirect_events_p95,
    sum(case when stage_name = 'request' then duration end) as cnt_request_duration,
    sum(case when stage_name = 'request' then duration_events end) as cnt_request_duration_events,
    sum(case when stage_name = 'request' then events end) as cnt_request_events,
    sum(case when stage_name = 'request' then events_p25 end) as cnt_request_events_p25,
    sum(case when stage_name = 'request' then events_p50 end) as cnt_request_events_p50,
    sum(case when stage_name = 'request' then events_p75 end) as cnt_request_events_p75,
    sum(case when stage_name = 'request' then events_p95 end) as cnt_request_events_p95,
    sum(case when stage_name = 'request_response' then duration end) as cnt_request_response_duration,
    sum(case when stage_name = 'request_response' then duration_events end) as cnt_request_response_duration_events,
    sum(case when stage_name = 'request_response' then events end) as cnt_request_response_events,
    sum(case when stage_name = 'request_response' then events_p25 end) as cnt_request_response_events_p25,
    sum(case when stage_name = 'request_response' then events_p50 end) as cnt_request_response_events_p50,
    sum(case when stage_name = 'request_response' then events_p75 end) as cnt_request_response_events_p75,
    sum(case when stage_name = 'request_response' then events_p95 end) as cnt_request_response_events_p95,
    sum(case when stage_name = 'response' then duration end) as cnt_response_duration,
    sum(case when stage_name = 'response' then duration_events end) as cnt_response_duration_events,
    sum(case when stage_name = 'response' then events end) as cnt_response_events,
    sum(case when stage_name = 'response' then events_p25 end) as cnt_response_events_p25,
    sum(case when stage_name = 'response' then events_p50 end) as cnt_response_events_p50,
    sum(case when stage_name = 'response' then events_p75 end) as cnt_response_events_p75,
    sum(case when stage_name = 'response' then events_p95 end) as cnt_response_events_p95,
    sum(case when stage_name = 'secure_connection' then duration end) as cnt_secure_connection_duration,
    sum(case when stage_name = 'secure_connection' then duration_events end) as cnt_secure_connection_duration_events,
    sum(case when stage_name = 'secure_connection' then events end) as cnt_secure_connection_events,
    sum(case when stage_name = 'secure_connection' then events_p25 end) as cnt_secure_connection_events_p25,
    sum(case when stage_name = 'secure_connection' then events_p50 end) as cnt_secure_connection_events_p50,
    sum(case when stage_name = 'secure_connection' then events_p75 end) as cnt_secure_connection_events_p75,
    sum(case when stage_name = 'secure_connection' then events_p95 end) as cnt_secure_connection_events_p95,
    sum(case when stage_name = 'session' then duration end) as cnt_session_duration,
    sum(case when stage_name = 'session' then duration_events end) as cnt_session_duration_events,
    sum(case when stage_name = 'session' then events end) as cnt_session_events,
    sum(case when stage_name = 'session' then events_p25 end) as cnt_session_events_p25,
    sum(case when stage_name = 'session' then events_p50 end) as cnt_session_events_p50,
    sum(case when stage_name = 'session' then events_p75 end) as cnt_session_events_p75,
    sum(case when stage_name = 'session' then events_p95 end) as cnt_session_events_p95,
    sum(case when stage_name = 'total_blocking_time' then duration end) as cnt_total_blocking_time_duration,
    sum(case when stage_name = 'total_blocking_time' then duration_events end) as cnt_total_blocking_time_duration_events,
    sum(case when stage_name = 'total_blocking_time' then events end) as cnt_total_blocking_time_events,
    sum(case when stage_name = 'total_blocking_time' then events_p25 end) as cnt_total_blocking_time_events_p25,
    sum(case when stage_name = 'total_blocking_time' then events_p50 end) as cnt_total_blocking_time_events_p50,
    sum(case when stage_name = 'total_blocking_time' then events_p75 end) as cnt_total_blocking_time_events_p75,
    sum(case when stage_name = 'total_blocking_time' then events_p95 end) as cnt_total_blocking_time_events_p95,
    sum(case when stage_name = 'ttfb' then duration end) as cnt_ttfb_duration,
    sum(case when stage_name = 'ttfb' then duration_events end) as cnt_ttfb_duration_events,
    sum(case when stage_name = 'ttfb' then events end) as cnt_ttfb_events,
    sum(case when stage_name = 'ttfb' then events_p25 end) as cnt_ttfb_events_p25,
    sum(case when stage_name = 'ttfb' then events_p50 end) as cnt_ttfb_events_p50,
    sum(case when stage_name = 'ttfb' then events_p75 end) as cnt_ttfb_events_p75,
    sum(case when stage_name = 'ttfb' then events_p95 end) as cnt_ttfb_events_p95,
    sum(case when stage_name = 'user_interactive' then duration end) as cnt_user_interactive_duration,
    sum(case when stage_name = 'user_interactive' then duration_events end) as cnt_user_interactive_duration_events,
    sum(case when stage_name = 'user_interactive' then events end) as cnt_user_interactive_events,
    sum(case when stage_name = 'user_interactive' then events_p25 end) as cnt_user_interactive_events_p25,
    sum(case when stage_name = 'user_interactive' then events_p50 end) as cnt_user_interactive_events_p50,
    sum(case when stage_name = 'user_interactive' then events_p75 end) as cnt_user_interactive_events_p75,
    sum(case when stage_name = 'user_interactive' then events_p95 end) as cnt_user_interactive_events_p95
from perf_web t
;

create metrics perf_web_cookie as
select
    sum(case when cnt_initial_page_render > 0 then 1 end) as users_initial_page_render
from (
    select
        cookie_id, cookie,
        sum(case when stage_name = 'initial_page_render' then initial_page_render end) as cnt_initial_page_render
    from perf_web t
    group by cookie_id, cookie
) _
;
