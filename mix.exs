defmodule Carpool.MixProject do
  use Mix.Project

  def project do
    [
      app: :carpool,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Carpool, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:csv, "~> 2.0.0"}
    ]
  end
end
