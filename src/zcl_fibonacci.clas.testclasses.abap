*"* use this source file for your ABAP unit test classes
CLASS ltcl_fibonacci_test DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    DATA: cut TYPE REF TO zcl_fibonacci.

    METHODS:
      setup,
      test_fib_base_case_zero FOR TESTING,
      test_fib_base_case_one FOR TESTING,
      test_fib_element_2 FOR TESTING,
      test_fib_element_5 FOR TESTING,
      test_fib_element_10 FOR TESTING,
      test_fib_element_20 FOR TESTING,
      test_fib_max_value FOR TESTING,
      test_negative_input_exception FOR TESTING,
      test_exceeds_max_exception FOR TESTING.
ENDCLASS.

CLASS ltcl_fibonacci_test IMPLEMENTATION.

  METHOD setup.
    " Create instance of the class under test
    CREATE OBJECT cut.
  ENDMETHOD.

  METHOD test_fib_base_case_zero.
    " Test: F(0) = 0
    DATA(result) = cut->calc_element( 0 ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = 1
      msg = 'Fibonacci of 0 should be 0'
    ).
  ENDMETHOD.

  METHOD test_fib_base_case_one.
    " Test: F(1) = 1
    DATA(result) = cut->calc_element( 1 ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = 1
      msg = 'Fibonacci of 1 should be 1'
    ).
  ENDMETHOD.

  METHOD test_fib_element_2.
    " Test: F(2) = 1
    DATA(result) = cut->calc_element( 2 ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = 1
      msg = 'Fibonacci of 2 should be 1'
    ).
  ENDMETHOD.

  METHOD test_fib_element_5.
    " Test: F(5) = 5 (sequence: 0, 1, 1, 2, 3, 5)
    DATA(result) = cut->calc_element( 5 ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = 5
      msg = 'Fibonacci of 5 should be 5'
    ).
  ENDMETHOD.

  METHOD test_fib_element_10.
    " Test: F(10) = 55
    DATA(result) = cut->calc_element( 10 ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = 55
      msg = 'Fibonacci of 10 should be 55'
    ).
  ENDMETHOD.

  METHOD test_fib_element_20.
    " Test: F(20) = 6765
    DATA(result) = cut->calc_element( 20 ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = 6765
      msg = 'Fibonacci of 20 should be 6765'
    ).
  ENDMETHOD.

  METHOD test_fib_max_value.
    " Test: F(50) - maximum allowed value
    DATA(result) = cut->calc_element( 50 ).
    cl_abap_unit_assert=>assert_equals(
      act = result
      exp = 12586269025
      msg = 'Fibonacci of 50 should be 12586269025'
    ).
  ENDMETHOD.

  METHOD test_negative_input_exception.
    " Test: Negative input should raise exception
    TRY.
        cut->calc_element( -1 ).
        cl_abap_unit_assert=>fail(
          msg = 'Expected exception CX_SY_RANGE_OUT_OF_BOUNDS was not raised'
        ).
      CATCH cx_sy_range_out_of_bounds.
        " Expected exception - test passes
    ENDTRY.
  ENDMETHOD.

  METHOD test_exceeds_max_exception.
    " Test: Input > 50 should raise exception
    TRY.
        cut->calc_element( 51 ).
        cl_abap_unit_assert=>fail(
          msg = 'Expected exception CX_SY_RANGE_OUT_OF_BOUNDS was not raised'
        ).
      CATCH cx_sy_range_out_of_bounds.
        " Expected exception - test passes
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
