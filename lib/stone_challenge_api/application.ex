defmodule StoneChallengeApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: StoneChallengeApi.Worker.start_link(arg)
      # {StoneChallengeApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: StoneChallengeApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
