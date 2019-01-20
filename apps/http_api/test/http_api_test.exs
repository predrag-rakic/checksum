defmodule HttpApiTest do
  use ExUnit.Case
  use Plug.Test
  doctest HttpApi

  import Mox

  @opts HttpApi.init([])

  setup do
    :verify_on_exit!

    :ok = Application.stop(:digits)
    {:ok, _} = Application.ensure_all_started(:digits)

    :ok
  end

  @tag :integration
  test "add for invalid sequence returns user error" do
    DigitsMock
    |> expect(:add, fn list -> Digits.add(list) end)

    conn = test_conn(:patch, ~S({"digits": "invalid seqence"}), 400)

    assert(
      conn.resp_body
      |> Jason.decode!()
      |> Map.get("message")
      |> String.contains?("Error")
    )
  end

  @tag :integration
  test "add for valid sequence returns nothing" do
    DigitsMock
    |> expect(:add, fn list -> Digits.add(list) end)

    test_conn(:patch, ~S({"digits": "1234567"}), 204)
  end

  @tag :integration
  test "clear returns nothing" do
    DigitsMock
    |> expect(:clear, fn -> Digits.clear() end)

    test_conn(:delete, nil, 204)
  end

  @tag :integration
  test "checksum computation returns integer" do
    DigitsMock
    |> expect(:compute_checksum, fn -> Digits.compute_checksum() end)

    conn = test_conn(:get, nil, 200)

    assert(
      conn.resp_body
      |> Jason.decode!()
      |> Map.get("checksum")
      |> is_integer()
    )
  end

  @tag :unit
  test "checksum computation times out" do
    DigitsMock
    |> expect(:compute_checksum, fn -> {:error, :timeout} end)

    conn = test_conn(:get, nil, 504)

    assert(
      "Request timedout" ==
        conn.resp_body
        |> Jason.decode!()
        |> Map.get("message")
    )
  end

  def test_conn(method, params, status_code) do
    conn =
      conn(method, "/checksum", params)
      |> put_req_header("content-type", "application/json")
      |> HttpApi.call(@opts)

    assert conn.state == :sent
    assert conn.status == status_code

    conn
  end
end
