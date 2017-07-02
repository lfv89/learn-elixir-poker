defmodule JudgeTest do
  use ExUnit.Case
  doctest Deck

  test "returns true for five cards of the same suit" do
    assert ["10S", "5S", "13S", "12S", "5S"] |> Judge.flush? == true
  end

  test "returns false for less than five cards of the same suit" do
    assert ["10D", "5S", "13S", "12S", "5S"] |> Judge.flush? == false
  end

  test "returns true for five cards in sequence" do
    assert ["2D", "3S", "4S", "5S", "6S"] |> Judge.straight? == true
  end

  test "returns false for five cards in sequence" do
    assert ["2D", "8S", "4S", "5S", "6S"] |> Judge.straight? == false
  end
end
