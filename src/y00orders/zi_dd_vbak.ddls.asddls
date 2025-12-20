@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SO HDR'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_DD_VBAK as select from y00vbak
composition [0..*] of ZI_DD_VBAP as _items
{
    key vbeln as Vbeln,
    ordertype as Ordertype,
    custname as Custname,
    orderdate as Orderdate,
    status as Status,
  @Semantics.user.createdBy: true
       created_by as CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    created_at as CreatedAt,
    @Semantics.user.lastChangedBy: true
    changed_by as ChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as ChangedAt,
   _items // Make association public
}
