defmodule Player do
  @spec shoot(list) :: list
  def shoot(board) do

    IO.puts("Enter coordinates to shoot at")

    try do
      x = IO.gets("x:") |> String.trim() |> String.to_integer()
      y = IO.gets("y:") |> String.trim() |> String.to_integer()

      if(x > length(board) || x < 0 || y < 0 || y > length(board)) do
        IO.puts("Error: coordinates out of bounds of the board. Try again!")
        shoot(board)
      else
        IO.puts("You are shooting at #{x}, #{y}...")
        cell_to_shoot = Enum.at(Enum.at(board, y), x)

        case cell_to_shoot do
          :empty -> board
          :buffer -> board
          :ship -> IO.puts("You hit! Shoot again!"); Board.update_cell(board, {y, x}, :hit) |> Board.print_board() |> shoot()
          :hit -> IO.puts("You have already shot there. Try again!"); shoot(board)
          :miss -> shoot(board)
          _ -> shoot(board)
        end
      end
    rescue
      error ->
      IO.inspect(error)
      Kernel.inspect(error)
      IO.puts("Error: Could not convert to integer")
      shoot(board)
    end
  end

end
