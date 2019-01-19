defmodule DigitsTest do
  use ExUnit.Case
  doctest Digits

  setup do
    assert Digits.clear() == :ok

    :ok
  end

  test "add valid sequence" do
    assert Digits.add("000") == {:ok, [0, 0, 0]}
    assert Digits.add("11") == {:ok, [0, 0, 0, 1, 1]}
  end

  test "add invalid sequence" do
    assert {:error, _} = Digits.add("0a00")
  end

  test "checksum emptu sequence" do
    assert Digits.compute_checksum() == {:ok, 0}
  end

  test "checksum non emptu sequence" do
    assert {:ok, _} = Digits.add("123456")
    assert Digits.compute_checksum() == {:ok, 1}
  end
end
