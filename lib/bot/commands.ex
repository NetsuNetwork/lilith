defmodule Lilith.Bot.Commands do
  @moduledoc false

  alias Nostrum.Api

  def exec(message, "hello", _args) do
    Api.create_message(message.channel_id, "Hello, World!")
  end

  def exec(_message, _command, _args) do
    :ignore
  end
end
