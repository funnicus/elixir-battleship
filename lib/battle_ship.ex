defmodule BattleShip do
  @moduledoc """
    The main module of the game. Includes the game loop function.
  """

  import Board
  import Ship


  @spec start(any, any) :: no_return
  def start(_type, _args) do
    IO.puts("Welcome to Battleship!")

    board = new_board(10)
    board2 = new_board(10)


    palyer_board = generate_random_ships(board, 5)
    cpu_board = generate_random_ships(board2, 5)

    gameLoop(palyer_board, cpu_board)
  end

  @spec gameLoop([list], [list]) :: no_return
  def gameLoop(player_board, cpu_board) do
    IO.puts("\n")

    IO.puts("CPU board:")
    print_board(cpu_board)

    IO.puts("\n")

    IO.puts("Your board:")
    print_board(player_board)

    try do
      new_cpu_board = Player.shoot(cpu_board)

      IO.puts("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")

      new_player_board = Cpu.shoot(player_board)

      gameLoop(new_player_board, new_cpu_board)
    rescue
      error ->
      IO.inspect(error)
      Kernel.inspect(error)
      IO.puts("Error: Could not convert to integer")
      gameLoop(player_board, cpu_board)
    end

  end
end
