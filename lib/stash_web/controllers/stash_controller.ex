defmodule StashWeb.StashController do
  use StashWeb, :controller

  def index(conn, _params) do
    stash = Stash.Server.list()

    render(conn, :index, stash: stash)
  end
end
