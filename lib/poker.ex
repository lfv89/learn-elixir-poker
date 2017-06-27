defmodule Poker do
  def suits do
   ['d', 'c', 'h', 's']
  end

  def values do
    Enum.to_list(2..14)
  end

  def deck_of_cards do
    for _suit <- suits(), _value <- values() do

    end
  end
end
