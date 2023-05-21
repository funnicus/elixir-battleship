defmodule BattleShip do
  @moduledoc """
  Documentation for `BattleShip`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> BattleShip.hello()
      :world

  """

  def new_board(board_size) do
    Enum.map(1..board_size, fn _ ->
      List.duplicate(:empty, board_size)
    end)
  end

  def update_cell(board, {x, y}, value) do
    Enum.with_index(board, fn(row, i) ->
      if i == x do
        Enum.with_index(row, fn(cell, j) ->
          if j == y do
            value
          else
            cell
          end
        end)
      else
        row
      end
    end)
  end

  defp create_ship(board, {x, y}, length, direction) do

    IO.puts(length)

    if length === 0 do
      board
    else
      updated_board = update_cell(board, {x, y}, :ship)

      case direction do
        :up -> create_ship(updated_board, {x, y + 1}, length - 1, direction)
        :down -> create_ship(updated_board, {x, y - 1}, length - 1, direction)
        :right -> create_ship(updated_board, {x + 1, y}, length - 1, direction)
        :left -> create_ship(updated_board, {x - 1, y}, length - 1, direction)
      end
    end
  end

  def generate_random_ships(board_size, num_ships) do
    board = new_board(board_size)

    directions = [:up, :down, :left, :right]

    Enum.reduce(1..num_ships, board, fn _, acc ->
      random_row = Enum.random(1..board_size)
      random_col = Enum.random(1..board_size)

      random_direction = Enum.random(directions)

      IO.puts(random_direction)

      #updated_board = update_cell(acc, {random_row, random_col}, :ship)

      create_ship(acc, {random_row, random_col}, 5, random_direction)

      # Enum.take_random(updated_board, random_row - 1) ++ [update_cell(Enum.at(updated_board, random_row - 1), random_col - 1, :ship)] ++ Enum.drop(updated_board, random_row)
    end)
  end

  defp ascii_representation(cell) do
    case cell do
      :empty -> "~"
      :buffer -> "+"
      :ship -> "S"
      :hit -> "X"
      :miss -> "O"
      _ -> "?"
    end
  end

  def print_board(board) do
    Enum.each(board, fn row ->
      Enum.each(row, fn cell ->
        IO.write("#{ascii_representation(cell)} ")
      end)
      IO.puts("")
    end)
  end

  def start do
    IO.puts("Welcome to Battleship!")
    board_size = read_board_size()
    board = new_board(board_size)
    # print_board(board)
    print_board(generate_random_ships(board_size, 5))
  end

  defp read_board_size do
    IO.gets("Enter the board size:") |> String.trim() |> String.to_integer()
  end

  def gameLoop(board) do
    IO.puts("Enter the coordinates of your shot:")
    # x = read_x()
    # y = read_y()
    # board = update_cell(board, {x, y}, :hit)
    # print_board(board)
    # gameLoop(board)
  end
end

BattleShip.start()
