defmodule HttpApi do
  @moduledoc """
  Documentation for HttpApi.
  """

  alias HttpApi.ComputeChecksum

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug Plug.Parsers, parsers: [:json], json_decoder: Jason
  plug :dispatch

  match _ do
    send_resp(conn, 400, "oops")
  end
end
