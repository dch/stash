defmodule Stash do
  @moduledoc """
  Stash is a simple key-value store.
  """

  @empty %{}

  @doc false
  def empty, do: @empty

  @doc """
  Bring Forth Thy Stash, In Alle Its Empty Glorie

  ## Examples

      iex> Stash.init()
      %{}
  """
  def init do
    @empty
  end

  @doc """
  Put a value into the stash, stored under the given key, and return
  the updated stash.

  ## Examples

      iex> Stash.put(Stash.init(), :foo, "bar")
      %{foo: "bar"}
  """
  def put(stash, key, value) do
    Map.put(stash, key, value)
  end

  @doc """
  Delete a key value pair from the stash, returning the updated stash.
  If the key is not found, the original stash is returned.

  ## Examples

      iex> Stash.delete(Stash.init(), :foo)
      {%{}, nil}

      iex> Stash.init() |> Stash.put(:foo, "bar") |> Stash.delete(:foo)
      {%{}, "bar"}
  """
  def delete(stash, key) do
    case Map.fetch(stash, key) do
      :error -> {stash, nil}
      {:ok, value} -> {Map.delete(stash, key), value}
    end
  end

  @doc """
  Fetch the value for a given key, from the stash, without modifying it.
  If the key is not found, return nil and the unmodified stash.
  """

  def get(stash, key) when is_map(stash) do
    # Map.get/3 returns nil when the key is not found
    {stash, Map.get(stash, key)}
  end

  @doc """
  Function to return entire contents of stash as a list

  """
  def list(stash) when is_map(stash) do
    Map.to_list(stash)
  end
end
