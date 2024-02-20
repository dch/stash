defmodule Stash.Server do
  use GenServer
  require Logger

  @moduledoc """
  Provides a stateful wrapper around a Stash instance.
  """

  # Public API
  def start, do: start_link(nil)

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  def put(key, value) do
    GenServer.call(__MODULE__, {:put, key, value})
  end

  def delete(key) do
    GenServer.call(__MODULE__, {:delete, key})
  end

  def list do
    GenServer.call(__MODULE__, {:list})
  end

  # callbacks

  def start_link(opts) do
    GenServer.start_link(__MODULE__, opts)
  end

  @impl GenServer
  def init(_opts) do
    Logger.info("Starting Stash Server")
    Process.register(self(), __MODULE__)
    {:ok, Stash.init()}
  end

  @impl GenServer
  def handle_call({:get, key}, _from, stash) do
    {_, value} = Stash.get(stash, key)
    {:reply, value, stash}
  end

  @impl GenServer
  def handle_call({:put, key, value}, _from, stash) do
    stash = Stash.put(stash, key, value)
    {:reply, :ok, stash}
  end

  @impl GenServer
  def handle_call({:delete, key}, _from, stash) do
    {stash, _value} = Stash.delete(stash, key)
    {:reply, :ok, stash}
  end

  @impl GenServer
  def handle_call({:list}, _from, stash) do
    {:reply, Stash.list(stash), stash}
  end
end
