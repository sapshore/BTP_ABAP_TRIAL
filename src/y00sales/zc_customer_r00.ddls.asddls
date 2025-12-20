@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CUSTOMER_R00
  provider contract transactional_query as projection on ZI_CUSTOMER_R00
{
    key CustomerUuid,
    key CustomerId,
    Name,
    Status,
    CreatedBy,
    CreatedAt,
    ChangedBy,
    ChangedAt
}
