defmodule Digits.ChecksumTest do
  use ExUnit.Case
  doctest Digits.Checksum, import: true

  alias Digits.Checksum

  test "empty sequence checksum is zero" do
    assert 0 == Checksum.compute([])
  end

  test "single element sequence, zero value equals zero" do
    assert 0 == Checksum.compute([0])
  end

  test "single element sequence, non zero value " do
    assert 7 == Checksum.compute([1])
  end

  test "two elements sequence, zero value equals zero" do
    assert 0 == Checksum.compute([0, 0])
  end

  test "two elements sequence, non zero values" do
    assert 5 == Checksum.compute([1, 2])
  end

  test "n elements sequence, zero values" do
    assert 0 == Checksum.compute([0, 0, 0, 0, 0])
  end

  test "n elements sequence, non zero values" do
    assert 7 == Checksum.compute([5, 4, 8, 9, 8, 5, 0, 3, 5, 4])
  end
end
