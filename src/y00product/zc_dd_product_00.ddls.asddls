@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Prod oo'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_DD_Product_00
  provider contract transactional_query as projection on ZI_DD_PRODUCT_00
{
    key ProdId,
    Name,
    Status,
    ProdGroup,
    CreatedBy,
    CreatedAt,
    ChangedBy,
    ChangedAt
}
