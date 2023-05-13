defmodule Lilith.Bot.Commander do
  @moduledoc false
  @prefix "%"

  @spec parse(String.t()) :: nil | {String.t(), list(String.t())}
  def parse(content) do
    if String.starts_with?(content, @prefix) do
      args =
        content
        |> String.slice(String.length(@prefix)..-1)
        |> String.split(" ")

      command = args |> List.first()
      args = args |> List.delete_at(0)

      {command, args}
    end

    nil
  end
end
