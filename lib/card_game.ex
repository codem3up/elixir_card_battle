defmodule CardGame do

  @default_num_players 2
  @default_hand_size 5

  def start_game() do
    Task.start_link(fn -> initialize(%Game{player_count: @default_num_players}) end)
  end

  def start_game(num_players) do
    Task.start_link(fn -> initialize(%Game{player_count: num_players}) end)
  end

  defp initialize(game = %Game{}) do
    deck = Cards.create_deck
    game = initialize_players(%{game | deck: deck})
    #IO.inspect game
    IO.puts "this is the game"
    players = game.players
    player = Player.deal_players(players, deck)
    %{game | players: player}
    IO.inspect player
    IO.inspect game
    #loop(game)
  end

  def initialize_players(game = %Game{}) do
    IO.puts "Playercount: #{game.player_count}"
    players = create_players([], game.player_count)
    %{game | players: players}
  end

  def create_players(player_list, value) when value <= 0 do  
    [] 
  end

  def create_players(player_list, playercount) do
    player = Player.create(%Player{})
    [player | create_players(player_list, playercount-1)]
  end

  defp loop(game = %Game{}) do
    receive do
      {:get, key, caller} ->
        #send caller, Map.get(map, key)
        loop(game)
      #{:put, key, value} ->
        #loop(Map.put(map, key, value))
      {:getobject, caller} ->
        #send caller, map
        loop(game)
    end
  end
end
