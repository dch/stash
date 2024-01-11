defmodule StashTest do
  use ExUnit.Case, async: true
  doctest Stash

  describe "the basics: " do
    test "init/0 should be empty and have zero elements" do
      # it should be empty on creation
      assert 0 == Stash.init() |> Enum.count()
      # confirm that the expected shape is returned
      assert Stash.empty() == Stash.init()
    end
    test "put/3 should insert a single element, order independent" do
      one = Stash.init() |> Stash.put("key", "value")
      assert 1 == Enum.count(one)
    end
    test "put/3 should grow the stash after inserting another element" do
      two = Stash.init() |> Stash.put("key", "value") |> Stash.put("another", "thing")
      assert 2 == Enum.count(two)
    end
  end
end
