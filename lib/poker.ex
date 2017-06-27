defmodule Poker do
  def suits do
   [:d, :c, :h, :s]
  end

  def values do
    Enum.to_list(2..14)
  end

  def deck_of_cards do
    for suit <- suits(), value <- values() do
      String.upcase("#{value}#{suit}")
    end
  end
end
