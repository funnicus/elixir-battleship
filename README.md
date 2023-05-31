# BattleShip

An Elixir implementation for a university course.

Documentation [here](./docs/DOCS.md)

## Exercise description

Implement a simple game using one of the non-mainstream languages and paradigms mentioned during the course.

In short, the main tasks of this exercise are:

1. pick an implementation language
2. implement the game using the language
3. test the game and assure that it behaves as intended
4. document how you used the language and paradigm

## Terminal commands

```bash
mix compile

mix run --no-halt # run and recompile on change

iex -S mix

iex> recompile()

mix test # tests

mix test test/battle_ship_test.exs:5 # single test

mix format --check-formatted

MIX_ENV=prod mix compile # start prod

mix help # for help
```
