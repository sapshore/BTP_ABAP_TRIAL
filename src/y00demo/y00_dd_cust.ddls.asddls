@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cust'
@Metadata.ignorePropagatedAnnotations: true
define root view entity Y00_DD_CUST as select from z00_customer

{
    key customer_uuid as CustomerUuid,
    key customer_id as CustomerId,
    customer_name as CustomerName,
    customer_email as CustomerEmail,
    status as Status,
    country as Country,
    region as Region,
    created_by as CreatedBy,
    created_at as CreatedAt,
    changed_by as ChangedBy,
    changed_at as ChangedAt
    
}
