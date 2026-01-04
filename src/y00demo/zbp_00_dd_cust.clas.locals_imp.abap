CLASS lhc_Y00_DD_CUST DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR y00_dd_cust RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR y00_dd_cust RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE y00_dd_cust.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE y00_dd_cust.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE y00_dd_cust.

    METHODS read FOR READ
      IMPORTING keys FOR READ y00_dd_cust RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK y00_dd_cust.

ENDCLASS.

CLASS lhc_Y00_DD_CUST IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_Y00_DD_CUST DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_Y00_DD_CUST IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
