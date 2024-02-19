defmodule Stash.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      StashWeb.Telemetry,
      Stash.Repo,
      {DNSCluster, query: Application.get_env(:stash, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Stash.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Stash.Finch},
      # Start a worker by calling: Stash.Worker.start_link(arg)
      # {Stash.Worker, arg},
      # Start to serve requests, typically the last entry
      StashWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Stash.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    StashWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
