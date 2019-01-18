defmodule Digits.ValidatorTest do
  use ExUnit.Case
  doctest Digits.Validator, import: true

  alias Digits.Validator

  test "valid sequence of digits returns ok" do
    assert Validator.validate_digits([1, 2, 3, 4, 5, 6, 7, 8]) == {:ok, ""}
  end

  test "invalid sequence of digits returns error" do
    assert {:error, msg} =  Validator.validate_digits([-2, 1, 13, 3, 6, 7, 44])
    assert String.contains?(msg, "[0, 2, 6]")
  end
end
