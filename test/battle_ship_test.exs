defmodule BattleShipTest do
  use ExUnit.Case
  doctest BattleShip

  test "greets the world" do
    assert BattleShip.hello() == :oops
  end
end
