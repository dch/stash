defmodule StashServerTest do
  use ExUnit.Case, async: true
  doctest Stash.Server
  alias Stash.Server

  describe "the basics: " do
    test "put/2 and get/1 insert and retrieve a consistent value" do
      k = :crypto.strong_rand_bytes(8) |> Base.encode16()
      v = :crypto.strong_rand_bytes(8) |> Base.encode16()
      assert :ok == Server.put(k, v)
      assert Server.get(k) == v
    end
  end

  test "put/2 and get/1 update a value successfully" do
    k = :crypto.strong_rand_bytes(8) |> Base.encode16()
    assert :ok == Server.put(k, :initial)
    assert Server.get(k) == :initial
    assert :ok == Server.put(k, :updated)
    assert Server.get(k) == :updated
  end

  test "put/2 and delete/1 clean up successfully" do
    k = :crypto.strong_rand_bytes(8) |> Base.encode16()
    assert :ok == Server.put(k, :whatever)
    assert :ok == Server.delete(k)
    assert Server.get(k) == nil
  end

  test "list/1 returns entire stash as list" do
    assert is_list(Server.list())
  end
end
