defmodule Stash do
  @moduledoc """
  Documentation for `Stash`, a simple key-value store.
  """

  @empty []

  @doc """
  Bring Forth Thy Stash, In Alle Its Glorie

  ## Examples

      iex> Stash.init()
      []

  """
  def init do
    @empty
  end

  @doc """
  test helper only, avoids leaking implementation details to test module
  """
  def empty, do: @empty

  def put(stash, key, value) do
    [{key, value} | stash]
  end

  @doc """
  there are many ways to implement get/2
  - we can use pattern matching & recursion (if this is a list)
  - we can use a built in function from the lists module
  - we can use Enum functions

  """
  def get([], _) do
    {@empty, nil}
  end

  def get(stash, key) do
    List.keytake(stash, key, 0)
  end

  def delete(stash, key) do
    case List.keytake(stash, key, 0) do
      nil ->
        # No item found, return unmodified stash, and nil
        {@empty, nil}

      # removed {found_item, remainder} ->
      {{_key, value}, tail} ->
        {tail, value}
    end
  end
end
