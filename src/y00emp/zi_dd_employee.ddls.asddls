@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Eplpoyee'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZI_DD_EMPLOYEE as select from z00_employee

{
    key empid as Empid,
    name as Name,
    email as Email,
    status as Status,
    department as Department
}
