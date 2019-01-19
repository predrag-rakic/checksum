defmodule HttpApi.Clear do

  use Plug.Builder

  import Plug.Conn

  plug :clear

  def clear(conn, _opts) do
    :ok = Digits.clear()

    send_resp(conn, 204, "")
  end
end
