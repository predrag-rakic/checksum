defmodule HttpApi.ComputeChecksum do

  use Plug.Builder

  import Plug.Conn

  plug :compute

  def compute(conn, _opts) do
    checksum = Digits.compute_checksum()

    response = %{checksum: checksum}

    send_resp(conn, 200, response |> Jason.encode!())
  end

end
