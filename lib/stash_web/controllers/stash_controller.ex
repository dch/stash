defmodule StashWeb.StashController do
  use StashWeb, :controller


  def index(conn, _params) do

    render(conn, :index, layout: false)
  end
end
