defmodule Sqlhelper.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      SqlhelperWeb.Telemetry,
      # Start the Ecto repository
      Sqlhelper.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Sqlhelper.PubSub},
      # Start Finch
      {Finch, name: Sqlhelper.Finch},
      # Start the Endpoint (http/https)
      SqlhelperWeb.Endpoint,
      Sqlhelper.DataCheckServer
      # Start a worker by calling: Sqlhelper.Worker.start_link(arg)
      # {Sqlhelper.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sqlhelper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SqlhelperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
