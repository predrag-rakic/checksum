defmodule HttpApiTest do
  use ExUnit.Case
  doctest HttpApi

  test "greets the world" do
    assert HttpApi.hello() == :world
  end
end
