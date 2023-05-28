defmodule Ship do
  @moduledoc """
    Documentation for `Ship`.
  """

  import Board

  defp tile_exists(tile, index) do
    if(tile === nil) do
      :error
    else
      Enum.at(tile, index)
    end
  end

  defp create_ship(board, {x, y}, length, direction) do
    if (length <= 0) do
      case direction do
        :vertical -> update_cell(board, {x, y}, :buffer)
        :horizontal -> update_cell(board, {x, y}, :buffer)
      end
    else
      row = Enum.at(board, x)
      tile = tile_exists(row, y)

      if (tile == :empty) do
        new_board = update_cell(board, {x, y}, :ship)
        case direction do
          :vertical -> update_cell(new_board, {x + 1, y}, :buffer)
                      |> update_cell({x - 1, y}, :buffer)
                      |> create_ship({x, y + 1}, length - 1, direction)
          :horizontal -> update_cell(new_board, {x, y + 1}, :buffer)
                      |> update_cell({x, y - 1}, :buffer)
                      |> create_ship({x + 1, y}, length - 1, direction)
        end
      else
        :error
      end
    end
  end

  @spec generate_random_ships(list(), integer) :: any
  def generate_random_ships(board, num_ships) do

    if num_ships == 0 do
      board # Return the board if we have placed all ships
    else
      directions = [:vertical, :horizontal]

      random_row = Enum.random(1..length(board))
      random_col = Enum.random(1..length(board))
      random_length = Enum.random(2..5)
      random_direction = Enum.random(directions)


      can_place = case random_direction do
        :vertical -> random_col + random_length < length(board)
        :horizontal -> random_row + random_length < length(board)
      end

      # Can ship be placed here?
      if(!can_place) do
        generate_random_ships(board, num_ships) # Try again if not
      else
        new_board = case random_direction do
          :vertical -> update_cell(board, {random_row, random_col - 1}, :buffer) |> create_ship({random_row, random_col}, random_length, random_direction)
          :horizontal -> update_cell(board, {random_row  - 1, random_col}, :buffer) |> create_ship({random_row, random_col}, random_length, random_direction)
        end

       if(new_board != :error) do
          generate_random_ships(new_board, num_ships - 1)
        else
          generate_random_ships(board, num_ships) # Try again if ships overlapped or were too close to each other
        end
      end
    end
  end

end
