defmodule Lilith.Bot.Events do
  @moduledoc false
  use Nostrum.Consumer

  alias Lilith.Bot.{Commander, Commands}

  import Logger

  def handle_event({:MESSAGE_CREATE, payload, _ws_state}) do
    case Commander.parse(payload.content) do
      {:ok, command, args} -> Commands.exec(payload, command, args)
      _ -> :ignore
    end

    :noop
  end

  def handle_event(_event) do
    :noop
  end
end
