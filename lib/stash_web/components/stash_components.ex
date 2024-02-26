defmodule StashWeb.StashComponents do
  @moduledoc """
  Provides core UI components.

  At first glance, this module may seem daunting, but its goal is to provide
  core building blocks for your application, such as modals, tables, and
  forms. The components consist mostly of markup and are well-documented
  with doc strings and declarative assigns. You may customize and style
  them in any way you want, based on your application growth and needs.

  The default components use Tailwind CSS, a utility-first CSS framework.
  See the [Tailwind CSS documentation](https://tailwindcss.com) to learn
  how to customize them or feel free to swap in another framework altogether.

  Icons are provided by [heroicons](https://heroicons.com). See `icon/1` for usage.
  """
  use Phoenix.Component

  # alias Phoenix.HTML.Form
  # alias Phoenix.LiveView.JS
  # import StashWeb.Gettext


    def tableheader(assigns) do
    ~H"""
    <thead>
    <tr>
      <th>Key</th>
      <th>Value</th>
      <th> Action</th>

    </tr>
    </thead>
    """
    end


    def tablebody(assigns) do
      ~H"""
      <tbody>
      <tr :for={{key, value} <- @stash}>
        <td>
          <%= key %>
        </td>

        <td>
          <%= value %>
        </td>
        <td>
        <.link navigate={~p"/"}> Delete</.link>
        </td>
      </tr>
      </tbody>
      """
    end
    #  <%= raw render_link(key) %>

end
