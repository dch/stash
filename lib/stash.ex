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

  def empty, do: @empty

end
