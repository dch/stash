defmodule Stash do
  @moduledoc """
  Stash is a simple key-value store.
  """

  @empty []

  @doc false
  def empty, do: @empty

  @doc """
  Bring Forth Thy Stash, In Alle Its Empty Glorie

  ## Examples

      iex> Stash.init()
      []
  """
  def init do
    @empty
  end

  @doc """
  Put a value into the stash, stored under the given key, and return
  the updated stash.

  ## Examples

      iex> Stash.put(Stash.init(), :foo, "bar")
      [{:foo, "bar"}]
  """
  def put(stash, key, value) do
    [{key, value} | stash]
  end

  @doc """
  Delete a key value pair from the stash, returning the updated stash.
  If the key is not found, the original stash is returned.

  ## Examples

      iex> Stash.delete(Stash.init(), :foo)
      {[], nil}

      iex> Stash.init() |> Stash.put(:foo, "bar") |> Stash.delete(:foo)
      {[], "bar"}
  """
  def delete(stash, key) do
    case List.keyfind(stash, key, 0) do
      nil -> {stash, nil}
      {^key, value} -> {List.keydelete(stash, key, 0), value}
    end
  end

  @doc """
  Fetch the value for a given key, from the stash, without modifying it.
  If the key is not found, return nil and the unmodified stash.
  """

  def get([], _), do: {@empty, nil}

  def get(stash, key) do
    case List.keyfind(stash, key, 0) do
      nil -> {stash, nil}
      {^key, value} -> {stash, value}
    end
  end
end
