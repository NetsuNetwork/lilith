defmodule Lilith.MixProject do
  use Mix.Project

  def project do
    [
      app: :lilith,
      version: "0.2.2",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Lilith, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:plug, "~> 1.14"},
      {:bandit, "~> 0.7.7"},
      {:jason, "~> 1.4"},
      {:nostrum, "~> 0.7.0-rc2"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dotenvy, "~> 0.7.0", only: [:dev, :test]},
      {:craft, only: [:dev], git: "https://github.com/NetsuNetwork/craft", tag: "v0.3.1"},
    ]
  end
end
