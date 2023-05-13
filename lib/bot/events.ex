defmodule Lilith.Bot.Events do
  @moduledoc false
  use Nostrum.Consumer

  alias Lilith.Bot.{Commander, Commands}

  import Logger

  def handle_event({:MESSAGE_CREATE, payload, _ws_state}) do
    Logger.info("Parsing a command")

    case Commander.parse(payload.content) do
      {command, args} ->
        IO.puts(command)
        IO.puts(args)
        Commands.exec(payload, command, args)

      nil ->
        :ignore
    end

    :noop
  end

  def handle_event(_event) do
    :noop
  end
end
