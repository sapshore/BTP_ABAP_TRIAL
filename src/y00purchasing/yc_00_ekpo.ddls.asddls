@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YC_00_EKPO'
@Metadata.ignorePropagatedAnnotations: true
@UI: { headerInfo: { typeName: 'Item',
                     typeNamePlural: 'Purchase Items'
      }}
define view entity YC_00_EKPO
  as projection on YI_00_EKPO
{

      @UI.facet: [ { id:            'Item',
                           purpose:       #STANDARD,
                           type:          #IDENTIFICATION_REFERENCE,
                           label:         'Item',
                           position:      10 }]
      @UI: { lineItem:       [ { position: 20, importance: #HIGH, label: 'Order ID' } ],
                  identification: [ { position: 20 , label: 'Order ID'} ] }
  key Ebeln,
      @UI: { lineItem:       [ { position: 30 , label: 'Item No' } ],
        identification: [ { position: 30 , label: 'Item No'} ] }
  key Ebelp,
      @UI: { lineItem:       [ { position: 40 , label: 'Plant' } ],
        identification: [ { position: 40 , label: 'Plant'} ] }
      Plant,
      @UI: { lineItem:       [ { position: 50 , label: 'Material' } ],
        identification: [ { position: 50 , label: 'Material'} ] }
      Material,
      @UI: { lineItem:       [ { position: 60 , label: 'Quantity' } ],
        identification: [ { position: 60 , label: 'Quantity'} ] }
      @Semantics.quantity.unitOfMeasure : 'Uom'
      Quantity,
      Uom,
      @UI: { lineItem:       [ { position: 70 , label: 'Currency' } ],
      identification: [ { position: 70 , label: 'Currency'} ] }
      @Semantics.amount.currencyCode : 'Currecny'
      Unitprice,

      Currecny,
      @UI: { lineItem:       [ { position: 80 , label: 'Delivery Date' } ],
      identification: [ { position: 80 , label: 'Delivery Date'} ] }
      Deliverydate,

      @UI.hidden: true
      Created_By,
      @UI.hidden: true
      Created_At,
      @UI.hidden: true
      Changed_By,
      @UI.hidden: true
      Changed_At,
      /* Associations */
      _header : redirected to parent YC_00_EKKO
}
