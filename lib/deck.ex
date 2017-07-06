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

  def extract_suits(cards) do
    List.flatten(Enum.map(cards, fn(e) -> Regex.replace(~r/\d{1,2}/, e, "") end))
  end

  def extract_values(cards) do
    Enum.map(List.flatten(Enum.map(cards, fn(e) -> List.last(Regex.run(~r/(\d{1,2})+/, e))  end)), fn(e) -> String.to_integer(e) end)
  end
end
