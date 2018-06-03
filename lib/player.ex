defmodule Player do
  defstruct pid: "", name: "John", hand: []

  def create(player = %Player{}) do
    { :ok, pid } = PlayerProcess.start_link    
    Map.put(%Player{}, :pid, pid)
  end

  def deal_players(players_list, deck) do 
    for player <- players_list do
      players_hand = player.hand
      {hand, deck} = Cards.deal(deck, 5)
      %{player | hand: hand}
    end
  end

end
