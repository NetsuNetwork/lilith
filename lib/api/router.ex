defmodule Lilith.API.Router do
  @moduledoc false
  use Plug.Router
  import Plug.Conn

  alias Nostrum.Cache.PresenceCache, as: Presence

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

  @spec respond(Plug.Conn, atom(), integer(), map()) :: Plug.Conn
  def respond(conn, :custom_json, code, message) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(code, Jason.encode!(message))
    |> halt()
  end

  get "/" do
    conn |> respond(:json, 200, "Welcome to Lilith!")
  end

  get "/presence/:id" do
    # case Discord.get_user(id) do
      # {:ok, user} ->
        # Extract individual fields or somehow
        # derive Jason for User struct
        # message = %{message: "found", user: user}
        # conn |> respond(:custom_json, 200, message)
    # end
    presence = Presence.get(id, 860843404077301790)
    IO.puts presence

    conn |> respond(:json, 200, "OK")
  end
end
