defmodule Test do
  def start_link do
    spawn_link(__MODULE__, :test, ["Weiner"])
  end
	
  def test(input) do
    IO.puts input
  end
end
