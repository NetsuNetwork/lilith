defmodule Lilith do
  @moduledoc false

  use Application
  require Logger

  def start(_args, _opts) do
    Logger.info("Booting up...")

    children = [{Bandit, plug: Lilith.API.Router, scheme: :http, port: 5489}, Lilith.Bot.Events]

    Supervisor.start_link(children, name: Lilith.Supervisor, strategy: :one_for_one)
  end
end
