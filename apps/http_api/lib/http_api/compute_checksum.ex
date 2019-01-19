defmodule HttpApi.ComputeChecksum do

  use Plug.Builder

  import Plug.Conn

  plug :compute

  def compute(conn, _opts) do
    Digits.compute_checksum()
    |> response(conn)
  end

  defp response({:ok, checksum}, conn) do
    response = %{checksum: checksum}
    send_resp(conn, 200, response |> Jason.encode!())
  end

  defp response({:error, :timeout}, conn) do
    send_resp(conn, 504, %{message: "Request timedout"} |> Jason.encode!())
  end
end
