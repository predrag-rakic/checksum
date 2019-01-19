defmodule HttpApi.Clear do

  use Plug.Builder

  import Plug.Conn

  alias HttpApi.DigitsClient

  plug :clear

  def clear(conn, _opts) do
    :ok = DigitsClient.clear()

    send_resp(conn, 204, "")
  end
end
