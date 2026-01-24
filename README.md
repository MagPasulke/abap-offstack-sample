# ABAP Fibonacci Calculator

This is an ABAP offstack project demonstrating a Fibonacci sequence calculator class.

## Overview

The project contains a class `ZCL_FIBONACCI` with a method `CALC_ELEMENT` that calculates the nth Fibonacci number efficiently and safely.

## Features

- **Input validation**: Accepts values from 0 to 50
- **Exception handling**: Raises `CX_SY_RANGE_OUT_OF_BOUNDS` for invalid inputs
- **Efficient calculation**: Uses iterative approach for optimal performance
- **Clean code**: Follows ABAP coding standards and passes all abaplint checks

## Class Structure

### ZCL_FIBONACCI
- **Method**: `calc_element`
  - **Parameter**: `n` (TYPE i) - The position in the Fibonacci sequence (0-50)
  - **Returns**: The nth Fibonacci number
  - **Raises**: `cx_sy_range_out_of_bounds` for invalid inputs

## Fibonacci Sequence Examples

| n | F(n) |
|---|------|
| 0 | 0    |
| 1 | 1    |
| 2 | 1    |
| 3 | 2    |
| 10| 55   |
| 20| 6765 |

## Testing

Unit tests are included in the `/test` directory to validate:
- Base cases (F(0), F(1))
- Sequence correctness 
- Exception handling for invalid inputs

## Quality Standards

- ✅ All abaplint checks pass
- ✅ Proper ABAP formatting
- ✅ Exception handling implemented
- ✅ Input validation included
- ✅ Unit tests provided

## Usage

```abap
DATA(fibonacci) = NEW zcl_fibonacci( ).
DATA(result) = fibonacci->calc_element( 10 ).
" result = 55
```
Learning open-abap &amp; abaplint
