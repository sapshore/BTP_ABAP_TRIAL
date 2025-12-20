@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SO ITEMS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_DD_VBAP as select from y00vbap
association to parent ZI_DD_VBAK as _header
    on $projection.Vbeln = _header.Vbeln
{
    key vbeln as Vbeln,
    key posnr as Posnr,
    material as Material,
      @Semantics.quantity.unitOfMeasure : 'Uom'
    quantity as Quantity,
    uom as Uom,
      @Semantics.amount.currencyCode : 'Currency'
    price as Price,
    currency as Currency,
    created_by as CreatedBy,
    created_at as CreatedAt,
    changed_by as ChangedBy,
    changed_at as ChangedAt,
    _header // Make association public
}
