select
        user_id,
        chat_id,
        event_date,
        model,
        is_asd,
        any_action,
        is_finished,
        is_billed
from
        dma.jobs_chatbot_chats_metrics
where cast(event_date as date) between :first_date and :last_date
