# BattleShip

An Elixir implementation for a university course.

In this implementation, you will play against a computer player on a 10x10 board with ship placements randomly generated. Five ships in total is given to you and the computer.

Documentation [here](./docs/DOCS.md)

## Exercise description

Implement a simple game using one of the non-mainstream languages and paradigms mentioned during the course.

In short, the main tasks of this exercise are:

1. pick an implementation language
2. implement the game using the language
3. test the game and assure that it behaves as intended
4. document how you used the language and paradigm

## Terminal commands to get started

```bash
mix compile

mix do deps.get, deps.compile # dependencies

mix run

```

## Other commands

```bash

mix run --no-halt # run and recompile on change

iex -S mix

iex> recompile() # to recompile in interactive shell

mix test # tests

mix test test/battle_ship_test.exs:5 # single test

mix format --check-formatted

MIX_ENV=prod mix compile # start prod

mix help # for help

```
