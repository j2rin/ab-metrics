create fact delivery_orders_seller as
select
    t.status_date::date as __date__,
    t.approximate_delivery_margin,
    t.approximate_delivery_provider_cost_no_vat,
    t.delivery_comission_no_vat,
    t.delivery_revenue_no_vat,
    t.deliveryorder_id,
    t.is_accepted,
    t.is_canceled,
    t.is_confirmed,
    t.is_created,
    t.is_paid,
    t.is_performed,
    t.is_provided,
    t.is_received,
    t.is_return_delivered,
    t.is_return_performed,
    t.is_returned,
    t.is_unconfirmed,
    t.is_unperformed,
    t.is_voided,
    t.item_price,
    t.real_delivery_margin,
    t.real_delivery_provider_cost_no_vat,
    t.safedeal_comission_no_vat,
    t.seller_commission,
    t.seller_id,
    t.status_date
from dma.vo_delivery_orders t
;

create metrics delivery_orders_seller as
select
    sum(case when is_canceled = True then approximate_delivery_margin end) as seller_delivery_approximate_margin_no_vat_canceled,
    sum(case when is_confirmed = True then approximate_delivery_margin end) as seller_delivery_approximate_margin_no_vat_confirmed,
    sum(case when is_created = True then approximate_delivery_margin end) as seller_delivery_approximate_margin_no_vat_created,
    sum(case when is_paid = True then approximate_delivery_margin end) as seller_delivery_approximate_margin_no_vat_paid,
    sum(case when is_unconfirmed = True then approximate_delivery_margin end) as seller_delivery_approximate_margin_no_vat_unconfirmed,
    sum(case when is_unperformed = True then approximate_delivery_margin end) as seller_delivery_approximate_margin_no_vat_unperformed,
    sum(case when is_voided = True then approximate_delivery_margin end) as seller_delivery_approximate_margin_no_vat_voided,
    sum(case when is_canceled = True then approximate_delivery_provider_cost_no_vat end) as seller_delivery_approximate_provider_cost_no_vat_canceled,
    sum(case when is_confirmed = True then approximate_delivery_provider_cost_no_vat end) as seller_delivery_approximate_provider_cost_no_vat_confirmed,
    sum(case when is_created = True then approximate_delivery_provider_cost_no_vat end) as seller_delivery_approximate_provider_cost_no_vat_created,
    sum(case when is_paid = True then approximate_delivery_provider_cost_no_vat end) as seller_delivery_approximate_provider_cost_no_vat_paid,
    sum(case when is_unconfirmed = True then approximate_delivery_provider_cost_no_vat end) as seller_delivery_approximate_provider_cost_no_vat_unconfirmed,
    sum(case when is_unperformed = True then approximate_delivery_provider_cost_no_vat end) as seller_delivery_approximate_provider_cost_no_vat_unperformed,
    sum(case when is_voided = True then approximate_delivery_provider_cost_no_vat end) as seller_delivery_approximate_provider_cost_no_vat_voided,
    sum(case when is_accepted = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_accepted,
    sum(case when is_canceled = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_canceled,
    sum(case when is_confirmed = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_confirmed,
    sum(case when is_created = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_created,
    sum(case when is_paid = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_paid,
    sum(case when is_performed = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_performed,
    sum(case when is_provided = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_provided,
    sum(case when is_received = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_received,
    sum(case when is_return_delivered = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_return_delivered,
    sum(case when is_return_performed = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_return_performed,
    sum(case when is_returned = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_returned,
    sum(case when is_unconfirmed = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_unconfirmed,
    sum(case when is_unperformed = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_unperformed,
    sum(case when is_voided = True then delivery_comission_no_vat end) as seller_delivery_delivery_comission_no_vat_voided,
    sum(case when is_accepted = True then item_price end) as seller_delivery_gmv_accepted,
    sum(case when is_canceled = True then item_price end) as seller_delivery_gmv_canceled,
    sum(case when is_confirmed = True then item_price end) as seller_delivery_gmv_confirmed,
    sum(case when is_created = True then item_price end) as seller_delivery_gmv_created,
    sum(case when is_paid = True then item_price end) as seller_delivery_gmv_paid,
    sum(case when is_performed = True then item_price end) as seller_delivery_gmv_performed,
    sum(case when is_provided = True then item_price end) as seller_delivery_gmv_provided,
    sum(case when is_received = True then item_price end) as seller_delivery_gmv_received,
    sum(case when is_return_delivered = True then item_price end) as seller_delivery_gmv_return_delivered,
    sum(case when is_return_performed = True then item_price end) as seller_delivery_gmv_return_performed,
    sum(case when is_returned = True then item_price end) as seller_delivery_gmv_returned,
    sum(case when is_unconfirmed = True then item_price end) as seller_delivery_gmv_unconfirmed,
    sum(case when is_unperformed = True then item_price end) as seller_delivery_gmv_unperformed,
    sum(case when is_voided = True then item_price end) as seller_delivery_gmv_voided,
    sum(case when is_accepted = True then 1 end) as seller_delivery_items_accepted,
    sum(case when is_canceled = True then 1 end) as seller_delivery_items_canceled,
    sum(case when is_confirmed = True then 1 end) as seller_delivery_items_confirmed,
    sum(case when is_created = True then 1 end) as seller_delivery_items_created,
    sum(case when is_paid = True then 1 end) as seller_delivery_items_paid,
    sum(case when is_performed = True then 1 end) as seller_delivery_items_performed,
    sum(case when is_provided = True then 1 end) as seller_delivery_items_provided,
    sum(case when is_received = True then 1 end) as seller_delivery_items_received,
    sum(case when is_return_delivered = True then 1 end) as seller_delivery_items_return_delivered,
    sum(case when is_return_performed = True then 1 end) as seller_delivery_items_return_performed,
    sum(case when is_returned = True then 1 end) as seller_delivery_items_returned,
    sum(case when is_unconfirmed = True then 1 end) as seller_delivery_items_unconfirmed,
    sum(case when is_unperformed = True then 1 end) as seller_delivery_items_unperformed,
    sum(case when is_voided = True then 1 end) as seller_delivery_items_voided,
    sum(case when is_accepted = True then real_delivery_margin end) as seller_delivery_real_margin_no_vat_accepted,
    sum(case when is_performed = True then real_delivery_margin end) as seller_delivery_real_margin_no_vat_performed,
    sum(case when is_provided = True then real_delivery_margin end) as seller_delivery_real_margin_no_vat_provided,
    sum(case when is_received = True then real_delivery_margin end) as seller_delivery_real_margin_no_vat_received,
    sum(case when is_return_delivered = True then real_delivery_margin end) as seller_delivery_real_margin_no_vat_return_delivered,
    sum(case when is_return_performed = True then real_delivery_margin end) as seller_delivery_real_margin_no_vat_return_performed,
    sum(case when is_returned = True then real_delivery_margin end) as seller_delivery_real_margin_no_vat_returned,
    sum(case when is_accepted = True then real_delivery_provider_cost_no_vat end) as seller_delivery_real_provider_cost_no_vat_accepted,
    sum(case when is_performed = True then real_delivery_provider_cost_no_vat end) as seller_delivery_real_provider_cost_no_vat_performed,
    sum(case when is_provided = True then real_delivery_provider_cost_no_vat end) as seller_delivery_real_provider_cost_no_vat_provided,
    sum(case when is_received = True then real_delivery_provider_cost_no_vat end) as seller_delivery_real_provider_cost_no_vat_received,
    sum(case when is_return_delivered = True then real_delivery_provider_cost_no_vat end) as seller_delivery_real_provider_cost_no_vat_return_delivered,
    sum(case when is_return_performed = True then real_delivery_provider_cost_no_vat end) as seller_delivery_real_provider_cost_no_vat_return_performed,
    sum(case when is_returned = True then real_delivery_provider_cost_no_vat end) as seller_delivery_real_provider_cost_no_vat_returned,
    sum(case when is_accepted = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_accepted,
    sum(case when is_canceled = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_canceled,
    sum(case when is_confirmed = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_confirmed,
    sum(case when is_created = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_created,
    sum(case when is_paid = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_paid,
    sum(case when is_performed = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_performed,
    sum(case when is_provided = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_provided,
    sum(case when is_received = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_received,
    sum(case when is_return_delivered = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_return_delivered,
    sum(case when is_return_performed = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_return_performed,
    sum(case when is_returned = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_returned,
    sum(case when is_unconfirmed = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_unconfirmed,
    sum(case when is_unperformed = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_unperformed,
    sum(case when is_voided = True then delivery_revenue_no_vat end) as seller_delivery_revenue_no_vat_voided,
    sum(case when is_accepted = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_accepted,
    sum(case when is_canceled = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_canceled,
    sum(case when is_confirmed = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_confirmed,
    sum(case when is_created = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_created,
    sum(case when is_paid = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_paid,
    sum(case when is_performed = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_performed,
    sum(case when is_provided = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_provided,
    sum(case when is_received = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_received,
    sum(case when is_return_delivered = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_return_delivered,
    sum(case when is_return_performed = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_return_performed,
    sum(case when is_returned = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_returned,
    sum(case when is_unconfirmed = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_unconfirmed,
    sum(case when is_unperformed = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_unperformed,
    sum(case when is_voided = True then safedeal_comission_no_vat end) as seller_delivery_safedeal_comission_no_vat_voided,
    sum(case when is_accepted = True then seller_commission end) as seller_delivery_seller_commission_accepted,
    sum(case when is_canceled = True then seller_commission end) as seller_delivery_seller_commission_canceled,
    sum(case when is_confirmed = True then seller_commission end) as seller_delivery_seller_commission_confirmed,
    sum(case when is_created = True then seller_commission end) as seller_delivery_seller_commission_created,
    sum(case when is_paid = True then seller_commission end) as seller_delivery_seller_commission_paid,
    sum(case when is_performed = True then seller_commission end) as seller_delivery_seller_commission_performed,
    sum(case when is_provided = True then seller_commission end) as seller_delivery_seller_commission_provided,
    sum(case when is_received = True then seller_commission end) as seller_delivery_seller_commission_received,
    sum(case when is_return_delivered = True then seller_commission end) as seller_delivery_seller_commission_return_delivered,
    sum(case when is_return_performed = True then seller_commission end) as seller_delivery_seller_commission_return_performed,
    sum(case when is_returned = True then seller_commission end) as seller_delivery_seller_commission_returned,
    sum(case when is_unconfirmed = True then seller_commission end) as seller_delivery_seller_commission_unconfirmed,
    sum(case when is_unperformed = True then seller_commission end) as seller_delivery_seller_commission_unperformed,
    sum(case when is_voided = True then seller_commission end) as seller_delivery_seller_commission_voided
from delivery_orders_seller t
;

create metrics delivery_orders_seller_deliveryorder_id as
select
    sum(case when seller_delivery_items_accepted > 0 then 1 end) as seller_delivery_orders_accepted,
    sum(case when seller_delivery_items_canceled > 0 then 1 end) as seller_delivery_orders_canceled,
    sum(case when seller_delivery_items_confirmed > 0 then 1 end) as seller_delivery_orders_confirmed,
    sum(case when seller_delivery_items_created > 0 then 1 end) as seller_delivery_orders_created,
    sum(case when seller_delivery_items_paid > 0 then 1 end) as seller_delivery_orders_paid,
    sum(case when seller_delivery_items_performed > 0 then 1 end) as seller_delivery_orders_performed,
    sum(case when seller_delivery_items_provided > 0 then 1 end) as seller_delivery_orders_provided,
    sum(case when seller_delivery_items_received > 0 then 1 end) as seller_delivery_orders_received,
    sum(case when seller_delivery_items_return_delivered > 0 then 1 end) as seller_delivery_orders_return_delivered,
    sum(case when seller_delivery_items_return_performed > 0 then 1 end) as seller_delivery_orders_return_performed,
    sum(case when seller_delivery_items_returned > 0 then 1 end) as seller_delivery_orders_returned,
    sum(case when seller_delivery_items_unconfirmed > 0 then 1 end) as seller_delivery_orders_unconfirmed,
    sum(case when seller_delivery_items_unperformed > 0 then 1 end) as seller_delivery_orders_unperformed,
    sum(case when seller_delivery_items_voided > 0 then 1 end) as seller_delivery_orders_voided
from (
    select
        seller_id, deliveryorder_id,
        sum(case when is_accepted = True then 1 end) as seller_delivery_items_accepted,
        sum(case when is_canceled = True then 1 end) as seller_delivery_items_canceled,
        sum(case when is_confirmed = True then 1 end) as seller_delivery_items_confirmed,
        sum(case when is_created = True then 1 end) as seller_delivery_items_created,
        sum(case when is_paid = True then 1 end) as seller_delivery_items_paid,
        sum(case when is_performed = True then 1 end) as seller_delivery_items_performed,
        sum(case when is_provided = True then 1 end) as seller_delivery_items_provided,
        sum(case when is_received = True then 1 end) as seller_delivery_items_received,
        sum(case when is_return_delivered = True then 1 end) as seller_delivery_items_return_delivered,
        sum(case when is_return_performed = True then 1 end) as seller_delivery_items_return_performed,
        sum(case when is_returned = True then 1 end) as seller_delivery_items_returned,
        sum(case when is_unconfirmed = True then 1 end) as seller_delivery_items_unconfirmed,
        sum(case when is_unperformed = True then 1 end) as seller_delivery_items_unperformed,
        sum(case when is_voided = True then 1 end) as seller_delivery_items_voided
    from delivery_orders_seller t
    group by seller_id, deliveryorder_id
) _
;
