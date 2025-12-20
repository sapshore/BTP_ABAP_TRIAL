@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Interface'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_DD_PRODUCT_00 as select from y00rap_product
{
    key prod_id as ProdId,
    name as Name,
    status as Status,
    prod_group as ProdGroup,
    @Semantics.user.createdBy: true
    created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    changed_by as ChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt
}
