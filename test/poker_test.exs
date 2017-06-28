defmodule PokerTest do
  use ExUnit.Case
  doctest Poker

  test "round has a deck list with 43 cards" do
    %Round { deck: deck } = Poker.round

    assert length(deck) == 43
  end

  test "round has a board list with 5 cards" do
    %Round { board: board } = Poker.round

    assert length(board) == 5
    assert length(board) == 5
  end

  test "round has a hands tuple with 2 hands, each with 2 cards" do
    %Round { hands: { h1, h2 } } = Poker.round

    assert length(h1) == 2
    assert length(h2) == 2
  end

  test "round's deck and board doesn't have repeated cards among them" do
    %Round { deck: deck, board: board } = Poker.round

    assert length(Enum.reject(deck, fn(card) ->
      Enum.member?(List.flatten(board), card)
    end)) == length(deck)
  end

  test "round's deck and hands doesn't have repeated cards among them" do
    %Round { deck: deck, hands: hands } = Poker.round

    assert length(Enum.reject(deck, fn(card) ->
      Enum.member?(List.flatten(Tuple.to_list(hands)), card)
    end)) == length(deck)
  end
end
