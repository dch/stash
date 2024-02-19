defmodule StashWeb.StashController do
  use StashWeb, :controller



  def index(conn, _params) do
    stash = Stash.init()
           |> Stash.put(:key, "value")
           |> Stash.put(:toy, "car")
           |> Stash.put(:hello, "greeting")

    render(conn, :index, stash: stash)
  end
end
