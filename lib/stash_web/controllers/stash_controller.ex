defmodule StashWeb.StashController do
  use StashWeb, :controller

  def index(conn, _params) do
    stash = Stash.Server.list()

    render(conn, :index, stash: stash)
  end

  def create(conn, %{"key" => key, "value" => value}) do
    :ok = Stash.Server.put(key, value)
    stash = Stash.Server.list()

    render(conn, :index, stash: stash)
  end

  def delete(conn, %{"key" => key}) do

    :ok = Stash.Server.delete(key)
    stash = Stash.Server.list()

    render(conn, :index, stash: stash)
  end
end
