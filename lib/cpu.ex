defmodule Cpu do
  @moduledoc """
    Functionalities for the computer player.
  """

  defp calcualte_shot_coordinates(board, x \\ nil, y \\ nil) do
    if x !== nil && y !== nil do
      search_axel = Enum.random([:x, :y])

      if search_axel == :x do
        row = x + Enum.random([-1, 1])
        col = y

        { row, col }
      else
        row = x
        col = y + Enum.random([-1, 1])

        { row, col }
      end
    else
      row = Enum.random(1..length(board))
      col = Enum.random(1..length(board))

      { row, col }
    end
  end

  @spec shoot(list, integer, integer) :: list
  def shoot(board, x \\ nil, y \\ nil) do

    IO.puts("CPU is shooting...")
    Process.sleep(1000)

    { row, col } = calcualte_shot_coordinates(board, x, y)

    cell_to_shoot = Enum.at(Enum.at(board, row), col)

    case cell_to_shoot do
      :empty -> Board.update_cell(board, {row, col}, :miss)
      :buffer -> Board.update_cell(board, {row, col}, :miss)
      :ship -> Board.update_cell(board, {row, col}, :hit) |> shoot(row, col)
      :hit -> shoot(board)
      :miss -> shoot(board)
      _ -> shoot(board)
    end
  end
end
