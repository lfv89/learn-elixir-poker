defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "suits returns available suits" do
    assert Poker.suits == ['d', 'c', 'h', 's']
  end

  test "values returns available values" do
    assert Poker.values == Enum.to_list(2..14)
  end

  test "deck of cards contains 52 elements" do
    assert length(Poker.deck_of_cards) == 52
  end
end
