defmodule Lilith.Bot.Commander do
  @moduledoc false
  @prefix "%"

  @spec parse(String.t()) :: {:ok, String.t(), list(String.t())} | {:error, String.t()}
  def parse(content) do
    if String.starts_with?(content, @prefix) do
      args =
        content
        |> String.slice(String.length(@prefix)..-1)
        |> String.split(" ")

      command = args |> List.first()
      args = args |> List.delete_at(0)

      {:ok, command, args}
    else
      {:error, "Could not parse message"}
    end
  end
end
