defmodule Hello do
  def test do
    list = [1, 2, 3, 4, 5]
    IO.inspect(Enum.sum(list))
  end
end
