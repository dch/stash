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

    test "get/2 should return the stored for a given key" do
      {_, value} = Stash.init() |> Stash.put("key", "value") |> Stash.get("key")
      assert "value" == value
    end

    test "get/2 should return the stash unchanged after fetching an item" do
      stash = Stash.init() |> Stash.put("key1", "value1")
      {result_stash, retrieved_value} = stash |> Stash.get("key1")

      assert retrieved_value == "value1"
      assert stash == result_stash
    end

    test "get/2 should return the empty stash even if the stash was empty" do
      {stash, _} = Stash.init() |> Stash.get("key")
      assert Stash.empty() == stash
    end

    test "removing an item makes a shorter list" do
      stash = Stash.init() |> Stash.put("key1", "value1") |> Stash.put("key2", "value2")
      {new_stash, _removed_value} = stash |> Stash.delete("key1")

      assert Enum.count(stash) - 1 == Enum.count(new_stash)
    end

    test "inserting a key, value pair and removing it results in the original list" do
      stash = Stash.init() |> Stash.put("key1", "value1")
      modified_stash = stash |> Stash.put("key2", "value2")

      assert {stash, "value2"} == modified_stash |> Stash.delete("key2")
    end

    test "retrieving a non-existing item results in nil and ensures stash remains unchanged" do
      stash = Stash.init() |> Stash.put("key1", "value1") |> Stash.put("key2", "value2")
      {result_stash, retrieved_value} = stash |> Stash.get("pretend_key")

      assert retrieved_value == nil
      assert stash == result_stash
    end

    test "list should return entire contents of stash as a list" do
      stash =
        Stash.init()
        |> Stash.put("key", "value")
        |> Stash.put("greeting", "hello")
        |> Stash.put("toy", "car")

      list = Stash.list(stash)
      assert Enum.count(stash) == Enum.count(list)
      assert is_list(list)
    end
  end

  describe "property tests: " do
    test "adding an item twice does not change stash size" do
      s = Stash.init() |> Stash.put(:k, :v) |> Stash.put(:k, :v)
      assert Enum.count(s) == 1
    end

    test "adding a key twice with different values does not change size of stash" do
      s = Stash.init() |> Stash.put(:k, :v) |> Stash.put(:k, :other)
      assert Enum.count(s) == 1
    end
  end
end
