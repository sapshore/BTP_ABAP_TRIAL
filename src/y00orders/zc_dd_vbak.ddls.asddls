@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumer view'
@Metadata.ignorePropagatedAnnotations: true
@UI: {
  headerInfo: { typeName: 'Order', typeNamePlural: 'Orders', title: { type: #STANDARD, value: 'Vbeln' } } }
define root view entity ZC_DD_VBAK
   as projection on ZI_DD_VBAK
{
 @UI.facet: [ { id:              'Order',
                      purpose:         #STANDARD,
                      type:            #IDENTIFICATION_REFERENCE,
                      label:           'Header',
                      position:        10 },
                    { id:              'Items',
                      purpose:         #STANDARD,
                      type:            #LINEITEM_REFERENCE,
                      label:           'Sales Items',
                      position:        20,
                      targetElement:   '_items'}]


  @UI: {
           lineItem:       [ { position: 10, importance: #HIGH } ],
           identification: [ { position: 10, label: 'Order ID' } ] }
    key Vbeln,
     @UI: {
         lineItem:       [ { position: 20 } ],
         identification: [ { position: 20, label: 'Order Type' } ] }
  Ordertype,
  @UI: {
     lineItem:       [ { position: 30 } ],
     identification: [ { position: 30, label: 'Customer Name' } ] }
  Custname,
  @UI: {
     lineItem:       [ { position: 40 } ],
     identification: [ { position: 40, label: 'Order Date' } ] }
  Orderdate,
  @UI: {
  lineItem:       [ { position: 50 } ],
  identification: [ { position: 50, label: 'Status' } ] }
  Status,
  @UI.hidden: true
  CreatedBy,
  @UI.hidden: true
  CreatedAt,
  @UI.hidden: true
  ChangedBy,
  @UI.hidden: true
  ChangedAt,
    
    /* Associations */
    _items : redirected to composition child ZC_DD_VBAP
    }
