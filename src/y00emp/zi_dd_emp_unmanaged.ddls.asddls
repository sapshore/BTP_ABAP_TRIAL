@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DD Unmanaged'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_DD_EMP_UNMANAGED as select from z00_employee

{
    key empid as Empid,
    name as Name,
    email as Email,
    status as Status,
    department as Department
}
