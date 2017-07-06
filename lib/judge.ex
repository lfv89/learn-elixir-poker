defmodule Judge do
  def pair?(hand_with_seven_cards) do
    two_repeated_values?(hand_with_seven_cards)
  end

  defp two_repeated_values?(hand_with_seven_cards) do
    hand_with_seven_cards
      |> Deck.extract_values
      |> Enum.sort
      |> Enum.chunk(2, 1)
      |> Enum.any?(fn(chunk) -> (chunk |> Enum.uniq |> length) == 1 end)
  end

  def two_pairs?(hand_with_seven_cards) do
    !set?(hand_with_seven_cards) &&
      2 == hand_with_seven_cards
        |> Deck.extract_values
        |> Enum.sort
        |> Enum.chunk(2, 1)
        |> Enum.filter(fn(chunk) -> chunk |> Enum.uniq |> length == 1 end)
        |> length
  end

  def set?(hand_with_seven_cards) do
    !quad?(hand_with_seven_cards) && three_repeated_values?(hand_with_seven_cards)
  end

  defp three_repeated_values?(hand_with_seven_cards) do
    hand_with_seven_cards
      |> Deck.extract_values
      |> Enum.sort
      |> Enum.chunk(3, 1)
      |> Enum.any?(fn(e) -> (e |> Enum.uniq |> length) == 1 end)
  end

  def quad?(hand_with_seven_cards) do
    four_repeated_values?(hand_with_seven_cards)
  end

  defp four_repeated_values?(hand_with_seven_cards) do
    hand_with_seven_cards
      |> Deck.extract_values
      |> Enum.sort
      |> Enum.chunk(4, 1)
      |> Enum.any?(fn(e) -> (e |> Enum.uniq |> length) == 1 end)
  end

  def flush?(hand_with_seven_cards) do
    hand_with_seven_cards
      |> Deck.extract_suits
      |> Enum.chunk(5, 1)
      |> Enum.any?(fn(e) -> (e |> Enum.uniq |> length) == 1 end)
  end

  def straight?(hand_with_seven_cards) do
    values = hand_with_seven_cards |> Deck.extract_values |> Enum.uniq |> Enum.sort |> Enum.chunk(5, 1)
    Enum.any?(values, fn(chunk) -> (map_value_and_index_sum(chunk) |> Enum.uniq |> length) == 1 end)
  end

  defp map_value_and_index_sum(values) do
    Enum.map(Enum.with_index(Enum.reverse(values)), fn({ value, index }) -> value + index end)
  end

  def full_house?(hand_with_seven_cards) do
    pair?(hand_with_seven_cards) && set?(hand_with_seven_cards) &&
      hand_with_seven_cards |> Deck.extract_values |> Enum.uniq |> length <= 4
  end
end
