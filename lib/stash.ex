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
end
