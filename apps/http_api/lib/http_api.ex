defmodule HttpApi do
  @moduledoc """
  Router.
  """

  alias HttpApi.{Add, Clear, ComputeChecksum}

  use Plug.Router

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)
  plug(:dispatch)

  get("/checksum", to: ComputeChecksum)

  delete("/checksum", to: Clear)

  patch("/checksum", to: Add)

  match _ do
    send_resp(conn, 400, "oops")
  end
end
