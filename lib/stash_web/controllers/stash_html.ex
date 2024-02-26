defmodule StashWeb.StashHTML do
  use StashWeb, :html
  alias StashWeb.StashComponents

 def render_link(key) do

  ~s(<a href="/stash/delete/#{key}"> Delete </a>)

 end

  embed_templates "stash_html/*"
end
