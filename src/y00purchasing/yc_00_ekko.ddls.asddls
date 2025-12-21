@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YC_00_EKKO'
@Metadata.ignorePropagatedAnnotations: true

@UI: { headerInfo: { typeName: 'Purchase Order',
                     typeNamePlural: 'Purchase Orders'

                     }}
define root view entity YC_00_EKKO
  as projection on YI_00_EKKO
{

      @UI.facet: [ { id:              'Purchase_Order',
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
  key Ebeln,
                               @UI: {
           lineItem:       [ { position: 20} ],
           identification: [ { position: 20, label: 'Purch Group' } ] }
      Purchgrp,
                                     @UI: {
           lineItem:       [ { position: 30} ],
           identification: [ { position: 30, label: 'Purch Org' } ] }
      Purchorg,
      
                                     @UI: {
           lineItem:       [ { position: 40} ],
           identification: [ { position: 40, label: 'Supplier' } ] }
      Supplier,
                                           @UI: {
           lineItem:       [ { position: 50} ],
           identification: [ { position: 50, label: 'Order Date' } ] }
      Orderdate,
      
      @UI.hidden: true
      Created_By,
            @UI.hidden: true
      Created_At,
            @UI.hidden: true
      Changed_By,
            @UI.hidden: true
      Changed_At,
      /* Associations */
      _items : redirected to composition child YC_00_EKPO
}
