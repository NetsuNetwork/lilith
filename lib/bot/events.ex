defmodule Lilith.Bot.Events do
  @moduledoc false
  use Nostrum.Consumer

  alias Nostrum.Api
  alias Lilith.Bot.{Commander, Commands}

  import Logger

  def handle_event({:MESSAGE_CREATE, payload, _ws_state}) do
    unless payload.content |> String.starts_with?("::") do
      Logger.info("Parsing a command")
      {command, args} = Commander.parse(payload.content)

      IO.puts command
      IO.puts args
    end
  end

  def handle_event(_event) do
    :noop
  end
end
