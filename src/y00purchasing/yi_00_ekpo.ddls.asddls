@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YI_00_EKPO'
@Metadata.ignorePropagatedAnnotations: true
define view entity YI_00_EKPO as select from y00ekpo
association to parent YI_00_EKKO as _header
    on $projection.Ebeln = _header.Ebeln
{
    key ebeln as Ebeln,
    key ebelp as Ebelp,
    plant as Plant,
    material as Material,
  @Semantics.quantity.unitOfMeasure : 'uom'
    quantity as Quantity,
    uom as Uom,
      @Semantics.amount.currencyCode : 'currecny'
    unitprice as Unitprice,
    currecny as Currecny,
    deliverydate as Deliverydate,
   @Semantics.user.createdBy: true
       created_by as Created_By,
    @Semantics.systemDateTime.createdAt: true
    created_at as Created_At,
    @Semantics.user.lastChangedBy: true
    changed_by as Changed_By,
   @Semantics.systemDateTime.lastChangedAt: true
    changed_at as Changed_At,
    _header // Make association public
}
