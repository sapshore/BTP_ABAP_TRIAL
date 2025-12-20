@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for customer'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CUSTOMER_R01 as select from z00_customer
//composition of target_data_source_name as _association_name
{
    key customer_uuid as CustomerUUID,
     key customer_id as CustomerId,
    customer_name as CustomerName,
    customer_email as CustomerEmail,
    status as Status,
    country as Country,
    region as Region,
    @Semantics.user.createdBy: true
       created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    changed_by as ChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt
     
}
