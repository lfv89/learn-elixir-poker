defmodule Judge do
  def flush?(hand_with_five_cards) do
    hand_with_five_cards |> Deck.extract_suits |> Enum.uniq |> length == 1
  end

  def straight?(hand_with_five_cards) do
    hand_with_five_cards |> Enum.sort |> Deck.extract_values |> map_values_subtractions |> Enum.uniq |> length == 1
  end

  defp map_values_subtractions(values) do
    Enum.reduce_while(Enum.with_index(values), [], fn(e, acc) -> (((values |> Enum.at(1 + List.last(e |> Tuple.to_list))) == nil) && {:halt, acc}) || {:cont, [((values |> Enum.at(1 + List.last(e |> Tuple.to_list))) - (values |> Enum.at(List.last(e |> Tuple.to_list)))) | acc]} end)
  end
end
