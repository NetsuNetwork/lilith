defmodule Lilith.API.Router do
  @moduledoc false
  use Plug.Router
  import Plug.Conn

  if Mix.env() == :dev do
    plug(Plug.Logger)
  end

  plug(:match)
  plug(:dispatch)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)

  @spec respond(Plug.Conn, atom(), integer(), String.t()) :: Plug.Conn
  def respond(conn, :json, code, message) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(code, Jason.encode!(%{message: message}))
    |> halt()
  end

  get "/" do
    conn |> respond(:json, 200, "Welcome to Lilith!")
  end
end
