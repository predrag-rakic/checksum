defmodule HttpApi.Add do

  use Plug.Builder

  import Plug.Conn

  alias HttpApi.DigitsClient

  plug :add

  def add(conn, _opts) do
    conn.params
    |> Map.get("digits", "")
    |> DigitsClient.add()
    |> case do
      {:ok, _} ->
        send_resp(conn, 204, "")

      {:error, error} ->
        message = "Invalid digits: #{error}"
        send_resp(conn, 400, %{message: message} |> Jason.encode!())
    end
  end
end
