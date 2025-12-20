@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CUSTOMER_R00 as select from y00rap_customer

{
    key customer_uuid as CustomerUuid,
    key customer_id as CustomerId,
    name as Name,
    status as Status,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    changed_by as ChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt

}
