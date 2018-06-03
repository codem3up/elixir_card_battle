defmodule Player do
  defstruct pid: "", name: "", hand: []

  def create(player = %Player{}) do
    { :ok, pid } = PlayerProcess.start_link    
    Map.put(player, :pid, pid)
  end

  def deal_player(player, deck) do
    { hand, deck } = Cards.deal(deck, 5) 
    { %{player | hand: hand }, deck } 
  end

  def deal_players([], deck) do
    [deck]
  end

  def deal_players(players_list, deck) do
    [ player | players_list ] = players_list
    { player, deck } = deal_player(player, deck) 
    
    list = [ player | deal_players(players_list, deck) ]
  end

end
