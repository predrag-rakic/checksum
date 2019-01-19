defmodule HttpApi do
  @moduledoc """
  Documentation for HttpApi.
  """

  alias HttpApi.{ComputeChecksum, Clear}

  use Plug.Router

  plug Plug.Logger
  plug :match
  plug Plug.Parsers, parsers: [:json], json_decoder: Jason
  plug :dispatch

  get "/checksum", to: ComputeChecksum

  delete "/checksum", to: Clear

  match _ do
    send_resp(conn, 400, "oops")
  end
end
