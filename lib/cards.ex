defmodule Cards do
  import KV
  @default_card_count 1

  def create_deck do
    values = [ "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine",
             "Ten", "Jack", "Queen", "King", "Ace" ]
    suits = [ "Clubs", "Dimonds", "Hearts", "Spades" ]
    
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end



  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def create_shuffled_deck do
    Cards.create_deck
    |> Cards.shuffle
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def get_hand(deck, card_count) do
    Enum.split(shuffle(deck), card_count)
  end

  def deal(deck, number_of_cards) do
    sdeck = Cards.shuffle(deck) 
    {hand, rest} = Enum.split(sdeck, number_of_cards)
  end

  def deal(deck) do
    sdeck = Cards.shuffle(deck) 
    {hand, rest} = Enum.split(deck, @default_card_count)
  end

  def deal() do
    {hand, rest} = Cards.deck |> Cards.shuffle |> Cards.get_hand(5)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary } -> :erlang.binary_to_term(binary)
      {:error, _reason } -> "That file does not exist"
    end
  end

  def fizzbuzz(one, two, three) do
    fizz = fn
      0, 0, _ -> "FizzBuzz"
      0, _, _ -> "Fizz"
      _, 0, _ -> "Buzz"
      _, _, last -> last
    end

    fizz.(one, two, three)
  end

  def myMap([ head | tail ], func) do
    [ func.(head) | myMap(tail, func) ]
  end

  def sum([]) do 0 end

  def sum ([head | tail]) do
    head + sum(tail)
  end


  defp secondSum([], total) do total end

  defp secondSum([head | tail], total) do
    secondSum(tail, total + head)
  end

  def secondSum(list) do
    secondSum(list, 0)
  end

end
