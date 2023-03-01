defmodule MovieNight.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      MovieNightWeb.Telemetry,
      # Start the Ecto repository
      MovieNight.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: MovieNight.PubSub},
      # Start Finch
      {Finch, name: MovieNight.Finch},
      # Start the Endpoint (http/https)
      MovieNightWeb.Endpoint
      # Start a worker by calling: MovieNight.Worker.start_link(arg)
      # {MovieNight.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MovieNight.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MovieNightWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
