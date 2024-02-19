defmodule Stash.Repo do
  use Ecto.Repo,
    otp_app: :stash,
    adapter: Ecto.Adapters.Postgres
end
