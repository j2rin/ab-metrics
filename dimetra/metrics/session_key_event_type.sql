create fact session_key_event_type as
select
    t.cookie_id as cookie,
    t.cookie_id,
    t.event_date,
    t.key_event_type_id,
    t.seconds_from_start_to_event,
    t.time_to_event_p25,
    t.time_to_event_p50,
    t.time_to_event_p75,
    t.time_to_event_p99
from dma.vo_session_key_event_type t
;

create metrics session_key_event_type as
select
    sum(case when key_event_type_id = 1 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_add_review_less_p25,
    sum(case when key_event_type_id = 1 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_add_review_less_p50,
    sum(case when key_event_type_id = 1 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_add_review_less_p75,
    sum(case when key_event_type_id = 1 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_add_review_less_p99,
    sum(case when key_event_type_id = 1 then 1 end) as ss_key_ev_add_review_total,
    sum(case when key_event_type_id = 6 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_contact_less_p25,
    sum(case when key_event_type_id = 6 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_contact_less_p50,
    sum(case when key_event_type_id = 6 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_contact_less_p75,
    sum(case when key_event_type_id = 6 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_contact_less_p99,
    sum(case when key_event_type_id = 6 then 1 end) as ss_key_ev_contact_total,
    sum(case when key_event_type_id = 7 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_favorite_less_p25,
    sum(case when key_event_type_id = 7 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_favorite_less_p50,
    sum(case when key_event_type_id = 7 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_favorite_less_p75,
    sum(case when key_event_type_id = 7 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_favorite_less_p99,
    sum(case when key_event_type_id = 7 then 1 end) as ss_key_ev_favorite_total,
    sum(case when key_event_type_id = 4 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_item_reactivated_less_p25,
    sum(case when key_event_type_id = 4 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_item_reactivated_less_p50,
    sum(case when key_event_type_id = 4 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_item_reactivated_less_p75,
    sum(case when key_event_type_id = 4 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_item_reactivated_less_p99,
    sum(case when key_event_type_id = 4 then 1 end) as ss_key_ev_item_reactivated_total,
    sum(case when key_event_type_id = 3 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_item_started_less_p25,
    sum(case when key_event_type_id = 3 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_item_started_less_p50,
    sum(case when key_event_type_id = 3 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_item_started_less_p75,
    sum(case when key_event_type_id = 3 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_item_started_less_p99,
    sum(case when key_event_type_id = 3 then 1 end) as ss_key_ev_item_started_total,
    sum(case when key_event_type_id = 2 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_open_chat_less_p25,
    sum(case when key_event_type_id = 2 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_open_chat_less_p50,
    sum(case when key_event_type_id = 2 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_open_chat_less_p75,
    sum(case when key_event_type_id = 2 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_open_chat_less_p99,
    sum(case when key_event_type_id = 2 then 1 end) as ss_key_ev_open_chat_total,
    sum(case when key_event_type_id = 5 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_payment_less_p25,
    sum(case when key_event_type_id = 5 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_payment_less_p50,
    sum(case when key_event_type_id = 5 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_payment_less_p75,
    sum(case when key_event_type_id = 5 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_payment_less_p99,
    sum(case when key_event_type_id = 5 then 1 end) as ss_key_ev_payment_total,
    sum(case when key_event_type_id = 10 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_restore_less_p25,
    sum(case when key_event_type_id = 10 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_restore_less_p50,
    sum(case when key_event_type_id = 10 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_restore_less_p75,
    sum(case when key_event_type_id = 10 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_restore_less_p99,
    sum(case when key_event_type_id = 10 then 1 end) as ss_key_ev_restore_total,
    sum(case when key_event_type_id = 8 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_search_item_view_less_p25,
    sum(case when key_event_type_id = 8 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_search_item_view_less_p50,
    sum(case when key_event_type_id = 8 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_search_item_view_less_p75,
    sum(case when key_event_type_id = 8 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_search_item_view_less_p99,
    sum(case when key_event_type_id = 8 then 1 end) as ss_key_ev_search_item_view_total,
    sum(case when key_event_type_id = 9 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_seller_item_actions_less_p25,
    sum(case when key_event_type_id = 9 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_seller_item_actions_less_p50,
    sum(case when key_event_type_id = 9 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_seller_item_actions_less_p75,
    sum(case when key_event_type_id = 9 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_seller_item_actions_less_p99,
    sum(case when key_event_type_id = 9 then 1 end) as ss_key_ev_seller_item_actions_total
from session_key_event_type t
;

create metrics session_key_event_type_cookie as
select
    sum(case when ss_key_ev_add_review_less_p25 > 0 then 1 end) as users_ss_key_ev_add_review_less_p25,
    sum(case when ss_key_ev_add_review_less_p50 > 0 then 1 end) as users_ss_key_ev_add_review_less_p50,
    sum(case when ss_key_ev_add_review_less_p75 > 0 then 1 end) as users_ss_key_ev_add_review_less_p75,
    sum(case when ss_key_ev_add_review_less_p99 > 0 then 1 end) as users_ss_key_ev_add_review_less_p99,
    sum(case when ss_key_ev_add_review_total > 0 then 1 end) as users_ss_key_ev_add_review_total,
    sum(case when ss_key_ev_contact_less_p25 > 0 then 1 end) as users_ss_key_ev_contact_less_p25,
    sum(case when ss_key_ev_contact_less_p50 > 0 then 1 end) as users_ss_key_ev_contact_less_p50,
    sum(case when ss_key_ev_contact_less_p75 > 0 then 1 end) as users_ss_key_ev_contact_less_p75,
    sum(case when ss_key_ev_contact_less_p99 > 0 then 1 end) as users_ss_key_ev_contact_less_p99,
    sum(case when ss_key_ev_contact_total > 0 then 1 end) as users_ss_key_ev_contact_total,
    sum(case when ss_key_ev_favorite_less_p25 > 0 then 1 end) as users_ss_key_ev_favorite_less_p25,
    sum(case when ss_key_ev_favorite_less_p50 > 0 then 1 end) as users_ss_key_ev_favorite_less_p50,
    sum(case when ss_key_ev_favorite_less_p75 > 0 then 1 end) as users_ss_key_ev_favorite_less_p75,
    sum(case when ss_key_ev_favorite_less_p99 > 0 then 1 end) as users_ss_key_ev_favorite_less_p99,
    sum(case when ss_key_ev_favorite_total > 0 then 1 end) as users_ss_key_ev_favorite_total,
    sum(case when ss_key_ev_item_reactivated_less_p25 > 0 then 1 end) as users_ss_key_ev_item_reactivated_less_p25,
    sum(case when ss_key_ev_item_reactivated_less_p50 > 0 then 1 end) as users_ss_key_ev_item_reactivated_less_p50,
    sum(case when ss_key_ev_item_reactivated_less_p75 > 0 then 1 end) as users_ss_key_ev_item_reactivated_less_p75,
    sum(case when ss_key_ev_item_reactivated_less_p99 > 0 then 1 end) as users_ss_key_ev_item_reactivated_less_p99,
    sum(case when ss_key_ev_item_reactivated_total > 0 then 1 end) as users_ss_key_ev_item_reactivated_total,
    sum(case when ss_key_ev_item_started_less_p25 > 0 then 1 end) as users_ss_key_ev_item_started_less_p25,
    sum(case when ss_key_ev_item_started_less_p50 > 0 then 1 end) as users_ss_key_ev_item_started_less_p50,
    sum(case when ss_key_ev_item_started_less_p75 > 0 then 1 end) as users_ss_key_ev_item_started_less_p75,
    sum(case when ss_key_ev_item_started_less_p99 > 0 then 1 end) as users_ss_key_ev_item_started_less_p99,
    sum(case when ss_key_ev_item_started_total > 0 then 1 end) as users_ss_key_ev_item_started_total,
    sum(case when ss_key_ev_open_chat_less_p25 > 0 then 1 end) as users_ss_key_ev_open_chat_less_p25,
    sum(case when ss_key_ev_open_chat_less_p50 > 0 then 1 end) as users_ss_key_ev_open_chat_less_p50,
    sum(case when ss_key_ev_open_chat_less_p75 > 0 then 1 end) as users_ss_key_ev_open_chat_less_p75,
    sum(case when ss_key_ev_open_chat_less_p99 > 0 then 1 end) as users_ss_key_ev_open_chat_less_p99,
    sum(case when ss_key_ev_open_chat_total > 0 then 1 end) as users_ss_key_ev_open_chat_total,
    sum(case when ss_key_ev_payment_less_p25 > 0 then 1 end) as users_ss_key_ev_payment_less_p25,
    sum(case when ss_key_ev_payment_less_p50 > 0 then 1 end) as users_ss_key_ev_payment_less_p50,
    sum(case when ss_key_ev_payment_less_p75 > 0 then 1 end) as users_ss_key_ev_payment_less_p75,
    sum(case when ss_key_ev_payment_less_p99 > 0 then 1 end) as users_ss_key_ev_payment_less_p99,
    sum(case when ss_key_ev_payment_total > 0 then 1 end) as users_ss_key_ev_payment_total,
    sum(case when ss_key_ev_restore_less_p25 > 0 then 1 end) as users_ss_key_ev_restore_less_p25,
    sum(case when ss_key_ev_restore_less_p50 > 0 then 1 end) as users_ss_key_ev_restore_less_p50,
    sum(case when ss_key_ev_restore_less_p75 > 0 then 1 end) as users_ss_key_ev_restore_less_p75,
    sum(case when ss_key_ev_restore_less_p99 > 0 then 1 end) as users_ss_key_ev_restore_less_p99,
    sum(case when ss_key_ev_restore_total > 0 then 1 end) as users_ss_key_ev_restore_total,
    sum(case when ss_key_ev_search_item_view_less_p25 > 0 then 1 end) as users_ss_key_ev_search_item_view_less_p25,
    sum(case when ss_key_ev_search_item_view_less_p50 > 0 then 1 end) as users_ss_key_ev_search_item_view_less_p50,
    sum(case when ss_key_ev_search_item_view_less_p75 > 0 then 1 end) as users_ss_key_ev_search_item_view_less_p75,
    sum(case when ss_key_ev_search_item_view_less_p99 > 0 then 1 end) as users_ss_key_ev_search_item_view_less_p99,
    sum(case when ss_key_ev_search_item_view_total > 0 then 1 end) as users_ss_key_ev_search_item_view_total,
    sum(case when ss_key_ev_seller_item_actions_less_p25 > 0 then 1 end) as users_ss_key_ev_seller_item_actions_less_p25,
    sum(case when ss_key_ev_seller_item_actions_less_p50 > 0 then 1 end) as users_ss_key_ev_seller_item_actions_less_p50,
    sum(case when ss_key_ev_seller_item_actions_less_p75 > 0 then 1 end) as users_ss_key_ev_seller_item_actions_less_p75,
    sum(case when ss_key_ev_seller_item_actions_less_p99 > 0 then 1 end) as users_ss_key_ev_seller_item_actions_less_p99,
    sum(case when ss_key_ev_seller_item_actions_total > 0 then 1 end) as users_ss_key_ev_seller_item_actions_total
from (
    select
        cookie_id, cookie,
        sum(case when key_event_type_id = 1 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_add_review_less_p25,
        sum(case when key_event_type_id = 1 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_add_review_less_p50,
        sum(case when key_event_type_id = 1 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_add_review_less_p75,
        sum(case when key_event_type_id = 1 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_add_review_less_p99,
        sum(case when key_event_type_id = 1 then 1 end) as ss_key_ev_add_review_total,
        sum(case when key_event_type_id = 6 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_contact_less_p25,
        sum(case when key_event_type_id = 6 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_contact_less_p50,
        sum(case when key_event_type_id = 6 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_contact_less_p75,
        sum(case when key_event_type_id = 6 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_contact_less_p99,
        sum(case when key_event_type_id = 6 then 1 end) as ss_key_ev_contact_total,
        sum(case when key_event_type_id = 7 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_favorite_less_p25,
        sum(case when key_event_type_id = 7 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_favorite_less_p50,
        sum(case when key_event_type_id = 7 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_favorite_less_p75,
        sum(case when key_event_type_id = 7 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_favorite_less_p99,
        sum(case when key_event_type_id = 7 then 1 end) as ss_key_ev_favorite_total,
        sum(case when key_event_type_id = 4 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_item_reactivated_less_p25,
        sum(case when key_event_type_id = 4 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_item_reactivated_less_p50,
        sum(case when key_event_type_id = 4 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_item_reactivated_less_p75,
        sum(case when key_event_type_id = 4 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_item_reactivated_less_p99,
        sum(case when key_event_type_id = 4 then 1 end) as ss_key_ev_item_reactivated_total,
        sum(case when key_event_type_id = 3 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_item_started_less_p25,
        sum(case when key_event_type_id = 3 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_item_started_less_p50,
        sum(case when key_event_type_id = 3 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_item_started_less_p75,
        sum(case when key_event_type_id = 3 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_item_started_less_p99,
        sum(case when key_event_type_id = 3 then 1 end) as ss_key_ev_item_started_total,
        sum(case when key_event_type_id = 2 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_open_chat_less_p25,
        sum(case when key_event_type_id = 2 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_open_chat_less_p50,
        sum(case when key_event_type_id = 2 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_open_chat_less_p75,
        sum(case when key_event_type_id = 2 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_open_chat_less_p99,
        sum(case when key_event_type_id = 2 then 1 end) as ss_key_ev_open_chat_total,
        sum(case when key_event_type_id = 5 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_payment_less_p25,
        sum(case when key_event_type_id = 5 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_payment_less_p50,
        sum(case when key_event_type_id = 5 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_payment_less_p75,
        sum(case when key_event_type_id = 5 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_payment_less_p99,
        sum(case when key_event_type_id = 5 then 1 end) as ss_key_ev_payment_total,
        sum(case when key_event_type_id = 10 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_restore_less_p25,
        sum(case when key_event_type_id = 10 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_restore_less_p50,
        sum(case when key_event_type_id = 10 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_restore_less_p75,
        sum(case when key_event_type_id = 10 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_restore_less_p99,
        sum(case when key_event_type_id = 10 then 1 end) as ss_key_ev_restore_total,
        sum(case when key_event_type_id = 8 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_search_item_view_less_p25,
        sum(case when key_event_type_id = 8 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_search_item_view_less_p50,
        sum(case when key_event_type_id = 8 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_search_item_view_less_p75,
        sum(case when key_event_type_id = 8 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_search_item_view_less_p99,
        sum(case when key_event_type_id = 8 then 1 end) as ss_key_ev_search_item_view_total,
        sum(case when key_event_type_id = 9 and seconds_from_start_to_event < time_to_event_p25 then 1 end) as ss_key_ev_seller_item_actions_less_p25,
        sum(case when key_event_type_id = 9 and seconds_from_start_to_event < time_to_event_p50 then 1 end) as ss_key_ev_seller_item_actions_less_p50,
        sum(case when key_event_type_id = 9 and seconds_from_start_to_event < time_to_event_p75 then 1 end) as ss_key_ev_seller_item_actions_less_p75,
        sum(case when key_event_type_id = 9 and seconds_from_start_to_event < time_to_event_p99 then 1 end) as ss_key_ev_seller_item_actions_less_p99,
        sum(case when key_event_type_id = 9 then 1 end) as ss_key_ev_seller_item_actions_total
    from session_key_event_type t
    group by cookie_id, cookie
) _
;
