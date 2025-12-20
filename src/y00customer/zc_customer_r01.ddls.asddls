@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Consumer'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CUSTOMER_R01 provider contract transactional_query as projection on ZI_CUSTOMER_R01
{
    key CustomerUUID,
    key CustomerId,
    CustomerName,
    CustomerEmail,
    Status,
    Country,
    Region,
    CreatedBy,
    CreatedAt,
    ChangedBy,
    ChangedAt
}
