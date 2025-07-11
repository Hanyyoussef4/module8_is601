import pytest
from app.operations import add, subtract, multiply, divide

def test_add_positive_numbers():
    assert add(2, 3) == 5

def test_add_negative_numbers():
    assert add(-1, -4) == -5

def test_subtract_positive_numbers():
    assert subtract(10, 7) == 3

def test_subtract_negative_result():
    assert subtract(5, 12) == -7

def test_multiply_numbers():
    assert multiply(3, 4) == 12

def test_multiply_by_zero():
    assert multiply(123, 0) == 0

def test_divide_numbers():
    assert divide(10, 2) == 5

def test_divide_floats():
    assert divide(7.5, 2.5) == pytest.approx(3.0)

def test_divide_by_zero_raises():
    with pytest.raises(ValueError) as excinfo:
        divide(5, 0)
    assert "division by zero" in str(excinfo.value).lower()
