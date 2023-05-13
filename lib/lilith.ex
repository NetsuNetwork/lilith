defmodule Lilith do
  @moduledoc false

  use Application
  require Logger

  def start(_args, _opts) do
    Logger.info("Booting up...")

    web = {Bandit, plug: Lilith.API.Router, scheme: :http, port: 5489}
    bot = Lilith.Bot.Events

    children = [web, bot]

    Supervisor.start_link(children, name: Lilith.Supervisor, strategy: :one_for_one)
  end
end
