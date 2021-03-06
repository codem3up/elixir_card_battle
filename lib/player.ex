defmodule Player do
  defstruct pid: "", name: "John", hand: []

  def create(player = %Player{}) do
    { :ok, pid } = PlayerProcess.start_link    
    Map.put(%Player{}, :pid, pid)
  end
end
