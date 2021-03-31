defmodule StoneChallengeApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :stone_challenge_api,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {StoneChallengeApi.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug, "~> 1.11"},
      {:plug_cowboy, "~> 2.4"}
    ]
  end
end
