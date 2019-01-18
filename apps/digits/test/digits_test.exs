defmodule DigitsTest do
  use ExUnit.Case
  doctest Digits

  setup do
    assert Digits.clear() == :ok

    :ok
  end

  test "add valid sequence" do
    assert Digits.add("000") == [0, 0, 0]
    assert Digits.add("11") == [0, 0, 0, 1, 1]
  end

  test "add invalid sequence" do
    assert {:error, _} = Digits.add("0a00")
  end

  test "checksum emptu sequence" do
    assert Digits.compute_checksum() == 0
  end

end
