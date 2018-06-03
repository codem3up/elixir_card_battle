defmodule PlayerProcess do

  def start_link do
    Task.start_link(fn -> loop(%Player{}) end)
  end

  defp loop(map) do
    receive do
      {:get, key, caller} ->
        send caller, Map.get(map, key)
        loop(map)
      {:put, key, value} ->
        loop(Map.put(map, key, value))
      {:getobject, caller} ->
        send caller, map
        loop(map)
    end
  end
end
