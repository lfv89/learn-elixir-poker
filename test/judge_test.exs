defmodule JudgeTest do
  use ExUnit.Case
  doctest Deck

  describe "pair?" do
    test "returns true for two cards of the same value" do
      assert ["9S", "9D", "10C", "7D", "5S", "3H", "2S"] |> Judge.pair? == true
    end

    test "returns false for less than two cards of the same value" do
      assert ["10S", "9D", "5S", "2C", "14S", "3H", "7S"] |> Judge.pair? == false
    end
  end

  describe "two_pairs?" do
    test "returns true for two cards of the same value twice" do
      assert ["9S", "9D", "10C", "10D", "5S", "3H", "2S"] |> Judge.two_pairs? == true
    end

    test "returns false for quads" do
      assert ["9S", "9D", "9H", "9S", "5S", "3H", "2S"] |> Judge.two_pairs? == false
    end

    test "returns false for set" do
      assert ["9S", "9D", "9H", "12S", "5S", "3H", "2S"] |> Judge.two_pairs? == false
    end
  end

  describe "quad?" do
    test "returns true for four cards of the same value" do
      assert ["10S", "10D", "10C", "10S", "5S", "3H", "14S"] |> Judge.quad? == true
    end

    test "returns false for less than four cards of the same value" do
      assert ["10S", "9D", "10C", "10S", "5S", "3H", "14S"] |> Judge.quad? == false
    end
  end

  describe "set?" do
    test "returns true for three cards of the same value" do
      assert ["10S", "10D", "10C", "12S", "5S", "3H", "14S"] |> Judge.set? == true
    end

    test "returns false for less than three cards of the same value" do
      assert ["10S", "9D", "10C", "12S", "5S", "3H", "14S"] |> Judge.set? == false
    end

    test "returns false for more than three cards of the same value" do
      assert ["10S", "10D", "10C", "10S", "5S", "3H", "14S"] |> Judge.set? == false
    end
  end

  describe "flush?" do
    test "returns true for five or more cards of the same suit" do
      assert ["10S", "5S", "13S", "12S", "5S", "3H", "14S"] |> Judge.flush? == true
    end

    test "returns false for less than five cards of the same suit" do
      assert ["10D", "5S", "13S", "12S", "5S", "3H", "1H"] |> Judge.flush? == false
    end
  end

  describe "straight?" do
    test "returns true for five cards in sequence" do
      assert ["2D", "3S", "4S", "5S", "6S", "3H", "10S"] |> Judge.straight? == true
    end

    test "with repeated cards, returns false for less than five cards in sequence" do
      assert ["2D", "3S", "4S", "5S", "13S", "3H", "12S"] |> Judge.straight? == false
    end

    test "with non repeated cards, returns false for less than five cards in sequence" do
      assert ["2D", "8S", "4S", "5S", "13S", "3H", "12S"] |> Judge.straight? == false
    end
  end

  describe "full_house?" do
    test "returns true if there is a pair and a set" do
      assert ["2D", "2S", "3S", "3S", "3S", "4H", "10S"] |> Judge.full_house? == true
    end

    test "returns false if there is a set but not a pair" do
      assert ["2D", "2S", "2S", "13S", "3S", "4H", "10S"] |> Judge.full_house? == false
    end
  end
end
