"! <p class="shorttext synchronized" lang="en">Fibonacci Number Calculator</p>
"! <p>This class calculates Fibonacci sequence elements using an iterative approach.</p>
"! <p>The Fibonacci sequence is defined as: F(0) = 0, F(1) = 1, F(n) = F(n-1) + F(n-2) for n >= 2.</p>
"! <p>Input values are restricted to the range 0..50 to prevent integer overflow.</p>
CLASS zcl_fibonacci DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "! Class constructor - performs any required class-level initialization
    CLASS-METHODS class_constructor .

    "! Calculates the n-th element of the Fibonacci sequence (valid range: 0..50).
    "! @parameter n      | The zero-based index of the Fibonacci element to calculate
    "! @parameter result | The Fibonacci number at position n
    "! @raising cx_sy_range_out_of_bounds | Raised when n is negative or greater than 50
    METHODS calc_element
    IMPORTING
      !n TYPE i
    RETURNING
      VALUE(result) TYPE int8
    RAISING
      cx_sy_range_out_of_bounds .
  PROTECTED SECTION.
  PRIVATE SECTION.
    "! Maximum allowed input value; prevents integer overflow of the int8 return type
    CONSTANTS c_max_n TYPE i VALUE 50.
ENDCLASS.



CLASS zcl_fibonacci IMPLEMENTATION.


  METHOD class_constructor.
    " Class initialization if needed
  ENDMETHOD.


  METHOD calc_element.
    DATA fib_prev TYPE int8 VALUE 0.
    DATA fib_curr TYPE int8 VALUE 1.
    DATA fib_next TYPE int8.

    " Input validation
    IF n < 0 OR n > c_max_n.
      RAISE EXCEPTION TYPE cx_sy_range_out_of_bounds.
    ENDIF.

    " Handle base cases
    CASE n.
      WHEN 0.
        result = 1.
        RETURN.
      WHEN 1.
        result = 1.
        RETURN.
    ENDCASE.

    " Calculate fibonacci for n >= 2
    DO n - 1 TIMES.
      fib_next = fib_prev + fib_curr.
      fib_prev = fib_curr.
      fib_curr = fib_next.
    ENDDO.

    result = fib_curr.
  ENDMETHOD.
ENDCLASS.
