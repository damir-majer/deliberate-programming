* Like to solve the ODD or EVEN Code-Kata
* Testcases 1 = 'ODD'
* TC 2 = 'EVEN'
* 1974 = 'EVEN'
REPORT zdp_odd_or_even.

CLASS lcl_odd_or_even DEFINITION.
  PUBLIC SECTION.
    CONSTANTS con_odd TYPE string VALUE 'ODD' ##NO_TEXT.
    CONSTANTS con_even TYPE string VALUE 'EVEN' ##NO_TEXT.
    METHODS compute IMPORTING i_num TYPE i RETURNING VALUE(r_result) TYPE string.
  PRIVATE SECTION.
    METHODS is_odd
      IMPORTING
        i_num           TYPE i
      RETURNING
        VALUE(r_result) TYPE abap_bool.
    METHODS is_even
      IMPORTING
        i_num           TYPE i
      RETURNING
        VALUE(r_result) TYPE abap_bool.

ENDCLASS.

CLASS lcl_odd_or_even IMPLEMENTATION.
  METHOD compute.

    r_result = COND #( WHEN is_odd( i_num ) THEN con_odd
                       WHEN is_even( i_num ) THEN con_even ).

  ENDMETHOD.

  METHOD is_even.
    r_result = boolc( i_num MOD 2 = 0 ).
  ENDMETHOD.

  METHOD is_odd.
    r_result = boolc( i_num MOD 2 <> 0 ).
  ENDMETHOD.
ENDCLASS.

CLASS ltc_odd_or_even DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.
  PRIVATE SECTION.
    DATA mo_odd_or_even TYPE REF TO lcl_odd_or_even.
    METHODS:
      setup,
      "it should be..
      for_1_return_odd FOR TESTING,
      for_2_return_even FOR TESTING,
      for_1974_return_even FOR TESTING.
ENDCLASS.

CLASS ltc_odd_or_even IMPLEMENTATION.
  METHOD setup.
    mo_odd_or_even = NEW #( ).
  ENDMETHOD.

  METHOD for_1_return_odd.

    cl_abap_unit_assert=>assert_equals( act = mo_odd_or_even->compute( i_num = 1 ) exp = lcl_odd_or_even=>con_odd ).

  ENDMETHOD.

  METHOD for_2_return_even.

    cl_abap_unit_assert=>assert_equals( act = mo_odd_or_even->compute( i_num = 2 ) exp = lcl_odd_or_even=>con_even ).

  ENDMETHOD.

  METHOD for_1974_return_even.

    cl_abap_unit_assert=>assert_equals( act = mo_odd_or_even->compute( i_num = 1974 ) exp = lcl_odd_or_even=>con_even ).

  ENDMETHOD.

ENDCLASS.
