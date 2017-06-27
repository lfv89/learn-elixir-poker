defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "suits returns available suits" do
    assert Poker.suits == [:d, :c, :h, :s]
  end

  test "values returns available values" do
    assert Poker.values == Enum.to_list(2..14)
  end

  test "deck of cards contains 52 elements" do
    assert length(Poker.deck_of_cards) == 52
  end

  test "deck of cards contains all of the diamonds cards" do
    diamonds = ["2D", "3D", "4D", "5D", "6D", "7D", "8D",
                "9D", "10D", "11D", "12D", "13D", "14D"]

    assert(Enum.all?(diamonds, fn(diamond) -> Enum.member?(Poker.deck_of_cards, diamond) end))
  end

  test "deck of cards contains all of the clubs cards" do
    clubs = ["2C", "3C", "4C", "5C", "6C", "7C", "8C",
             "9C", "10C", "11C", "12C", "13C", "14C"]

    assert(Enum.all?(clubs, fn(club) -> Enum.member?(Poker.deck_of_cards, club) end))
  end

  test "deck of cards contains all of the hearts cards" do
    hearts = ["2H", "3H", "4H", "5H", "6H", "7H", "8H",
             "9H", "10H", "11H", "12H", "13H", "14H"]

    assert(Enum.all?(hearts, fn(heart) -> Enum.member?(Poker.deck_of_cards, heart) end))
  end

  test "deck of cards contains all of the spades cards" do
    spades = ["2S", "3S", "4S", "5S", "6S", "7S", "8S",
             "9S", "10S", "11S", "12S", "13S", "14S"]

    assert(Enum.all?(spades, fn(spade) -> Enum.member?(Poker.deck_of_cards, spade) end))
  end
end
