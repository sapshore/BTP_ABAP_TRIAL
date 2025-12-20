CLASS zcl_00abhi_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
      CONSTANTS c_object    TYPE cl_numberrange_objects=>nr_attributes-object   VALUE 'ZNR_PRODID'.
    CONSTANTS c_package   TYPE cl_numberrange_objects=>nr_attributes-devclass VALUE 'Y00PRODUCT'.
    CONSTANTS c_transport TYPE cl_numberrange_objects=>nr_attributes-corrnr   VALUE ''.

    METHODS create_number_range_object
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.

    METHODS create_number_range
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.

    METHODS draw_number
      IMPORTING io_out TYPE REF TO if_oo_adt_classrun_out.
ENDCLASS.



CLASS zcl_00abhi_test IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
   draw_number( out ).
  ENDMETHOD.
  METHOD create_number_range_object.
    TRY.
        cl_numberrange_objects=>create( EXPORTING attributes = VALUE #( object     = c_object
                                                                        domlen     = 'Z00_PROD_ID'
                                                                        percentage = 10
                                                                        devclass   = c_package
                                                                        corrnr     = c_transport )
                                                  obj_text   = VALUE #( langu    = 'E'
                                                                        object   = c_object
                                                                        txtshort = 'Numbers (API)'
                                                                        txt      = 'Number range (API)' )
                                        IMPORTING errors     = DATA(lt_errors)
                                                  returncode = DATA(ld_return) ).
      CATCH cx_number_ranges INTO DATA(lo_error).
        io_out->write( lo_error->get_text( ) ).
    ENDTRY.

    io_out->write( lt_errors ).
    io_out->write( ld_return ).
  ENDMETHOD.


  METHOD create_number_range.
    TRY.
        cl_numberrange_intervals=>create(
          EXPORTING interval  = VALUE #( ( nrrangenr = '01' fromnumber = '100000' tonumber = '199999' procind = 'I' ) )
                    object    = c_object
          IMPORTING error     = DATA(ld_error)
                    error_inf = DATA(ls_error)
                    error_iv  = DATA(lt_error_iv)
                    warning   = DATA(ld_warning) ).

      CATCH cx_root INTO DATA(lo_error).
        io_out->write( lo_error->get_text( ) ).
    ENDTRY.

    io_out->write( ld_error ).
    io_out->write( ls_error ).
    io_out->write( lt_error_iv ).
    io_out->write( ld_warning ).
  ENDMETHOD.


  METHOD draw_number.
    TRY.
        cl_numberrange_runtime=>number_get( EXPORTING nr_range_nr = '01'
                                                      object      = c_object
                                            IMPORTING number      = DATA(ld_number)
                                                      returncode  = DATA(ld_rcode) ).

      CATCH cx_root INTO DATA(lo_error).
        io_out->write( lo_error->get_text( ) ).
    ENDTRY.

    io_out->write( ld_number ).
    io_out->write( ld_rcode ).
  ENDMETHOD.
ENDCLASS.
