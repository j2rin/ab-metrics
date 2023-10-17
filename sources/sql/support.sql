    select observation_date as event_date,
           platform_id,
           case when participant_type = 'visitor' then participant_id end as cookie_id,
  		   case when participant_type = 'user'    then participant_id end as user_id,
  		   participant_id,
  		   ticket_email_created,
		   ticket_wizard_created,
		   tickets_problem_changed,
           callcenter_calls,
           ticket_call_created,
           ticket_agent_created,
           ticket_call_esc_written_created,
           chats_created,
           ticket_reviews,
  		   ticket_call_reviews,
  	  	   chats_reviews,
		   ticket_anonnumber_templates,
		   ticket_anonnumber_nodes,
		   call_anonnumber_nodes,
		   chat_anonnumber_templates,
		   chat_anonnumber_nodes,
		   ticket_calltracking_templates,
		   ticket_calltracking_nodes,
		   call_calltracking_nodes,
		   chat_calltracking_nodes,
           ticket_satisfaction_scores,
           ticket_csat_scores,
 		   chat_satisfaction_scores,
           chat_csat_scores,
           ticket_automated,
  		   ticket_partly_automated,
  		   ticket_flow,
  		   chats_automated,
  		   chats_partly_automated,
  		   chats_flow,
           tickets_with_ht,
  		   chats_with_ht,
  		   ticket_ht,
  		   chat_ht,
  		   ticket_fully_automated,
           chat_fully_automated,
           ticket_information_request,
           ticket_platform_fraud_templates,
           ticket_platform_fraud_nodes,
           ticket_platform_fraud_templates_nodes,
           call_satisfaction_scores,
           call_csat_scores,
  		   call_ht,
  		   calls_with_ht,
  		   calls_abandoned,
  		   calls_ivr,
           chat_resolution_time,
  		   chat_solved,
           chat_on_time,
           chat_sl,
           call_transfered,
           call_queue_changed,
           chat_reopen,
           chat_thank_question,
           chat_reopen_after_thank
	  from dma.support_metric_observation
where cast(observation_date as date) between :first_date and :last_date
    --and observation_year between date_trunc('year', :first_date) and date_trunc('year', :last_date) --@trino
