defmodule HttpApi.ComputeChecksum do
  @moduledoc """
  Compute checksum operation controller.
  """

  use Plug.Builder

  import Plug.Conn

  alias HttpApi.DigitsClient

  plug :compute

  def compute(conn, _opts) do
    DigitsClient.compute_checksum()
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
