select
    user_id,
    autoload_package,
    event_date,
    vertical_id,
    vertical,
    logical_category_id,
    logical_category,
    category_id,
    category_name,
    subcategory_id,
    subcategory_name,
    validation_start,
    validation_end,
    total_validation_items,
    success_validation_items,
    potential_items_actions_after_validation,
    no_touch_items,
    future_activation_items,
    validation_errors,
    error_items,
    validation_alarms,
    alarm_items,
    validation_warnings,
    warning_items,
    add_total_attempts,
    add_total_responses,
    add_total_failed_attempts,
    add_total_success_attempts,
    add_attempt_items,
    add_success_items,
    add_time_spent_for_success_sec,
    update_total_attempts,
    update_total_responses,
    update_total_failed_attempts,
    update_total_success_attempts,
    update_attempt_items,
    update_success_items,
    update_total_time_spent_for_success_sec,
    reactivate_total_attempts,
    reactivate_total_responses,
    reactivate_total_failed_attempts,
    reactivate_total_success_attempts,
    reactivate_attempt_items,
    reactivate_success_items,
    reactivate_total_time_spent_for_success_sec,
    deactivate_total_attempts,
    deactivate_total_responses,
    deactivate_total_failed_attempts,
    deactivate_total_success_attempts,
    deactivate_attempt_items,
    deactivate_success_items,
    deactivate_total_time_spent_for_success_sec
from dma.autoload_feed_item_flow
where cast(event_date as date) between :first_date and :last_date
