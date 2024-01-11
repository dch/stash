defmodule StashTest do
  use ExUnit.Case, async: true
  doctest Stash

  test "the basics" do
    # it should be empty on creation
    assert 0 == Stash.init() |> Enum.count()
    # confirm that the expected shape is returned
    assert Stash.empty() == Stash.init()
  end
end
