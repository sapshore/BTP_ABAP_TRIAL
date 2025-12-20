@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZC_DD_VBAP'
@Metadata.ignorePropagatedAnnotations: true
@UI: {
  headerInfo: { typeName: 'Item',
                typeNamePlural: 'Items',
                title: { type: #STANDARD, value: 'Vbeln' } } }
define view entity ZC_DD_VBAP
   as projection on ZI_DD_VBAP
{

@UI.facet: [ { id:            'Item',
                     purpose:       #STANDARD,
                     type:          #IDENTIFICATION_REFERENCE,
                     label:         'Item',
                     position:      10 }]
 @UI: { lineItem:       [ { position: 20, importance: #HIGH, label: 'Order ID' } ],
             identification: [ { position: 20 , label: 'Order ID'} ] }
    key Vbeln,
       @UI: { lineItem:       [ { position: 30 , label: 'Item No' } ],
             identification: [ { position: 30 , label: 'Item No'} ] }
    key Posnr,
     @UI: { lineItem:       [ { position: 40 , label: 'Material' } ],
             identification: [ { position: 40, label: 'Material'  } ] }
    Material,
     @UI: { lineItem:       [ { position: 50 , label: 'Quantity'  } ],
             identification: [ { position: 50, label: 'Quantity'  } ] }
     @Semantics.quantity.unitOfMeasure : 'Uom'
    Quantity,
     @UI: { lineItem:       [ { position: 60, label: 'UOM'  } ],
             identification: [ { position: 60 , label: 'UOM' } ] }
    Uom,
     @UI: { lineItem:       [ { position: 70 , label: 'Price' } ],
             identification: [ { position: 70, label: 'Price'  } ] }
          @Semantics.amount.currencyCode : 'Currency'
    Price,
     @UI: { lineItem:       [ { position: 80 , label: 'Currency' } ],
             identification: [ { position: 80 , label: 'Currency' } ] }
    Currency,
        @UI.hidden: true
    CreatedBy,
        @UI.hidden: true
    CreatedAt,
        @UI.hidden: true
    ChangedBy,
        @UI.hidden: true
    ChangedAt,
    /* Associations */
    _header : redirected to parent ZC_DD_VBAK
}
