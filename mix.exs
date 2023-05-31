defmodule BattleShip.MixProject do use Mix.Project

  def project do
    [
      app: :battleship,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {BattleShip, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  def deps do
    [
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false},
    ]
  end
end
