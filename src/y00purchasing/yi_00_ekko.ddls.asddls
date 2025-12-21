@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YI_00_EKKO'
@Metadata.ignorePropagatedAnnotations: true
define root view entity YI_00_EKKO as select from y00ekko
composition  [0..*] of YI_00_EKPO as _items
{
    key ebeln as Ebeln,
    purchgrp as Purchgrp,
    purchorg as Purchorg,
    supplier as Supplier,
    orderdate as Orderdate,
    @Semantics.user.createdBy: true
       created_by as Created_By,
    @Semantics.systemDateTime.createdAt: true
    created_at as Created_At,
    @Semantics.user.lastChangedBy: true
    changed_by as Changed_By,
    @Semantics.systemDateTime.lastChangedAt: true
    changed_at as Changed_At,
    _items // Make association public
}
