defmodule Deck do
  def suits do
   [:d, :c, :h, :s]
  end

  def values do
    Enum.to_list(2..14)
  end

  def generate do
    for suit <- suits(), value <- values() do
      String.upcase("#{value}#{suit}")
    end
  end
end
