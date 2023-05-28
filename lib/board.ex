defmodule Board do
  @moduledoc """
    Functionalities for representing and manipulating the game boards.
  """

  defp ascii_representation(cell) do
    case cell do
      :empty -> "~"
      :buffer -> "~"
      :ship -> "S"
      :hit -> "X"
      :miss -> "~"
      _ -> "?"
    end
  end

  @doc "Updates the cell at the given coordinates with the given value."
  @spec update_cell(list(), {number(), number()}, any) :: list
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



  @doc "Prints the given board to the console."
  @spec print_board(list(list())) :: list(list())
  def print_board(board) do
    Enum.each(board, fn row ->
      Enum.each(row, fn cell ->
        IO.write("#{ascii_representation(cell)} ")
      end)
      IO.puts("")
    end)

    board
  end

  @doc "Creates a new board of the given size. The board is represented as a list of lists."
  @spec new_board(number()) :: list
  def new_board(board_size) do
    Enum.map(1..board_size, fn _ ->
      List.duplicate(:empty, board_size)
    end)
  end
end
