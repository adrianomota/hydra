defmodule Hydra.MixProject do
  use Mix.Project

  @github_url "https://github.com/adrianomota/hydra.git"

  def project do
    [
      app: :hydra,
      version: "0.1.0",
      elixir: "~> 1.13",
      description: "Hydra Project",
      source_utl: @github_url,
      homepage_url: @github_url,
      files: ~w(mix.exs lib LICENSE.md README.md CHANGELOG.md),
      package: [
        maintainers: ["Adriano de Lima Araujo Mota"],
        license: ["MIT"],
        links: %{
          "github" => @github_url
        }
      ],
      docs: [
        main: "readme",
        extras: ["readme.md", "CHANGELOG.md"]
      ],
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.json": :test,
        "coveralls.html": :test
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Hydra.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6.4"},
      {:phoenix_ecto, "~> 4.4"},
      {:ecto_sql, "~> 3.6"},
      {:postgrex, ">= 0.0.0"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 1.0"},
      {:gettext, "~> 0.18"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:absinthe, "~> 1.6"},
      {:absinthe_relay, "~> 1.5"},
      {:absinthe_plug, "~> 1.5"},
      {:absinthe_phoenix, "~> 2.0"},
      {:absinthe_error_payload, "~> 1.1"},
      {:dataloader, "~> 1.0"},
      {:mock, "~> 0.3.7"},
      {:broadway, "~> 1.0"},
      {:broadway_kafka, "~> 0.3.0"},
      {:mongodb_driver, "~> 0.8.0"},
      {:poolboy, "~> 1.5"},
      {:benchee, "~> 1.0"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:sobelow, "~> 0.11.1", only: :dev},
      {:excoveralls, "~> 0.14.4", only: :test},
      {:ex_machina, "~> 2.7"},
      {:faker, "~> 0.17", only: :test}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"]
    ]
  end
end
