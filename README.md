# BattleShip

An Elixir implementation for a university course.

## Terminal commands

```bash
mix compile

mix run --no-halt

iex -S mix

iex> recompile()

mix test

mix test test/battle_ship_test.exs:5 # single test

mix format --check-formatted

MIX_ENV=prod mix compile # start prod

mix help # for help
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `battleship` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:battleship, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/battleship>.
