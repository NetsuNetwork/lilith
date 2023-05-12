defmodule LilithTest do
  use ExUnit.Case
  doctest Lilith

  test "greets the world" do
    assert Lilith.hello() == :world
  end
end
