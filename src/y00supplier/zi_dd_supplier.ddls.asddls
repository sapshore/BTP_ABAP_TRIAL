@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_DD_SUPPLIER as select from z00_supplier
{
    key supplierid as Supplierid,
    partnercat as Partnercat,
    partnergrp as Partnergrp,
    bprole as Bprole,
    name as Name,
    email as Email,
    bank as Bank,
    status as Status,
    country as Country,
    region as Region,
    createdby as Createdby,
    createdat as Createdat,
    changedby as Changedby,
    changedat as Changedat

}
