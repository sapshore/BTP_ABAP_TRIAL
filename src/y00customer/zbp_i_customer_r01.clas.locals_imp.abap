CLASS lhc_ZI_CUSTOMER_R01 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_customer_r01 RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zi_customer_r01 RESULT result.

    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR zi_customer_r01~validateEmail.
    METHODS customerStatus FOR MODIFY
      IMPORTING keys FOR ACTION ZI_CUSTOMER_R01~customerStatus.
    METHODS copyCustomer FOR MODIFY
      IMPORTING keys FOR ACTION ZI_CUSTOMER_R01~copyCustomer.

ENDCLASS.

CLASS lhc_ZI_CUSTOMER_R01 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validateEmail.
    READ ENTITIES OF zi_customer_r01 IN LOCAL MODE
   ENTITY zi_customer_r01
    FIELDS ( CustomerEmail )
    WITH CORRESPONDING #(  keys )
   RESULT DATA(emails).
*    FAILED DATA(it_failed)
* REPORTED DATA(it_reported).

    LOOP AT emails INTO DATA(email).

      IF email-CustomerEmail IS INITIAL.

        APPEND VALUE #( %tky = email-%tky ) TO failed-zi_customer_r01.

        reported-zi_customer_r01  = VALUE #(

   ( %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error text = 'Email is mandatory' ) )
   ).

      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD customerStatus.
" Read entity
   READ ENTITIES OF zi_customer_r01 IN LOCAL MODE
   ENTITY zi_customer_r01
    FIELDS ( CustomerUUID Status )
    WITH CORRESPONDING #(  keys )
   RESULT DATA(it_status)
    FAILED DATA(it_failed).

    MODIFY ENTITIES OF zi_customer_r01 IN LOCAL MODE
      ENTITY zi_customer_r01
      UPDATE FIELDS ( Status ) with VALUE #( FOR key in keys ( %tky = key-%tky  Status = 'I' ) )
       FAILED   FINAL(fail_mod)
        REPORTED FINAL(rep_mod)
        MAPPED   FINAL(map_mod).

*   LOOP AT it_status INTO DATA(iv_status).
*
*  " "For key in keys
*MODIFY ENTITIES OF zi_customer_r01 IN LOCAL MODE
*      ENTITY zi_customer_r01
*      UPDATE FIELDS ( Status ) with VALUE #( ( %tky = iv_status-%tky  Status = 'A' ) )
*       FAILED   FINAL(fail_mod)
*        REPORTED FINAL(rep_mod)
*        MAPPED   FINAL(map_mod).
*      endloop.
  ENDMETHOD.

  METHOD copyCustomer.
   DATA:
      customers       TYPE TABLE FOR CREATE zi_customer_r01.

   READ ENTITIES OF zi_customer_r01 IN LOCAL MODE
   ENTITY zi_customer_r01
   ALL FIELDS WITH
     CORRESPONDING #(  keys )
   RESULT DATA(it_customer)
    FAILED DATA(it_failed).


    " LOOP AT it_customer INTO DATA(iv_cust).
      LOOP AT keys INTO DATA(key).
       READ TABLE it_customer ASSIGNING FIELD-SYMBOL(<cust>) WITH KEY id COMPONENTS %tky = key-%tky.
        IF sy-subrc EQ 0.
                "Fill travel container for creating new travel instance
        APPEND VALUE #( %cid  = key-%cid_ref
                        %data = CORRESPONDING #( <cust> EXCEPT CustomerId ) )
          TO CUSTOMERS ASSIGNING FIELD-SYMBOL(<new_cust>).

   "       <new_cust>-CustomerId     = .
        <new_cust>-Status      = 'N'.


"create new BO instance
    MODIFY ENTITIES OF zi_customer_r01 IN LOCAL MODE
      ENTITY zi_customer_r01
        CREATE AUTO FILL CID  FIELDS ( CustomerUUID CustomerId CustomerName CustomerEmail Region Status Country ChangedAt ChangedBy CreatedAt CreatedBy )
          WITH customers
      MAPPED DATA(mapped_create).

    mapped-zi_customer_r01   =  mapped_create-zi_customer_r01 .
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_CUSTOMER_R01 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_CUSTOMER_R01 IMPLEMENTATION.

  METHOD save_modified.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
