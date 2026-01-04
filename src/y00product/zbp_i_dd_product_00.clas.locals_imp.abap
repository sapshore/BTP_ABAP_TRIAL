CLASS lhc_ZI_DD_PRODUCT_00 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_dd_product_00 RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_dd_product_00 RESULT result.

ENDCLASS.

CLASS lhc_ZI_DD_PRODUCT_00 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_DD_PRODUCT_00 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS adjust_numbers REDEFINITION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.
  PRIVATE SECTION.
    METHODS new_method
      IMPORTING
        i_number_range_returned_quanti TYPE cl_numberrange_runtime=>nr_returned_quantity
        i_number_range_key             TYPE cl_numberrange_runtime=>nr_number
      EXPORTING
        ed_max_prod_id                 TYPE p.

ENDCLASS.

CLASS lsc_ZI_DD_PRODUCT_00 IMPLEMENTATION.

  METHOD adjust_numbers.

  SELECT FROM y00rap_product
  FIELDS MAX( prod_id )
  INTO @DATA(ld_max_prod_id).


*
LOOP AT mapped-zi_dd_product_00 REFERENCE INTO DATA(lr_product).
  ld_max_prod_id += 1.
  lr_product->ProdId = ld_max_prod_id.

   " lr_product->ProdId = ld_max_prod_id.

      ENDLOOP.
  ENDMETHOD.

  METHOD new_method.

    ed_max_prod_id  = i_number_range_key - i_number_range_returned_quanti.


  ENDMETHOD.



  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
