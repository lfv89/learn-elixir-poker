defmodule Poker do
  def round do
    %Round {}
      |> build_deck
      |> build_board
      |> build_hands
  end

  defp build_deck(round) do
    %Round { round | deck: Deck.generate }
  end

  defp build_board(%Round { deck: deck } = round) do
    board = Enum.take_random(deck, 5)
    %Round { round | board: board, deck: Enum.reject(deck, fn(card) -> Enum.member?(board, card) end) }
  end

  defp build_hands(%Round { deck: deck } = round) do
    hands = [Enum.take_random(deck, 2), Enum.take_random(deck, 2)]
    %Round { round | hands: List.to_tuple(hands), deck: Enum.reject(deck, fn(card) -> Enum.member?(List.flatten(hands), card) end) }
  end
end
