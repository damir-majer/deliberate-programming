* Like to solve the ODD or EVEN Code-Kata
* Testcases 1 = 'ODD'
* TC 2 = 'EVEN'
* 1974 = 'EVEN'
REPORT zdp_odd_or_even.

CLASS lcl_odd_or_even DEFINITION.
  PUBLIC SECTION.
    METHODS compute IMPORTING i_num TYPE i RETURNING VALUE(r_result) TYPE string.
ENDCLASS.

CLASS lcl_odd_or_even IMPLEMENTATION.
  METHOD compute.
    r_result = 'ODD'.
  ENDMETHOD.
ENDCLASS.

CLASS ltc_odd_or_even DEFINITION FOR TESTING RISK LEVEL HARMLESS DURATION SHORT.
  PUBLIC SECTION.
    METHODS:
      x FOR TESTING.
ENDCLASS.

CLASS ltc_odd_or_even IMPLEMENTATION.
  METHOD x.
    DATA lo_odd_or_even TYPE REF TO lcl_odd_or_even.
    lo_odd_or_even = NEW #( ).

    cl_abap_unit_assert=>assert_equals( act = lo_odd_or_even->compute( i_num = 1 ) exp = 'ODD' ).

  ENDMETHOD.
ENDCLASS.
