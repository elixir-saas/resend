defmodule Resend.MixProject do
  use Mix.Project

  @version "0.4.3"
  @source_url "https://github.com/elixir-saas/resend-elixir"

  def project do
    [
      app: :resend,
      version: @version,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  defp description() do
    "API client for Resend, the new email API for developers."
  end

  defp package() do
    [
      description: description(),
      licenses: ["Apache-2.0"],
      maintainers: [
        "Justin Tormey"
      ],
      links: %{
        "GitHub" => @source_url,
        "Resend" => "https://resend.com/",
        "Elixir Example" => "https://github.com/resendlabs/resend-elixir-example",
        "Phoenix Example" => "https://github.com/resendlabs/resend-phoenix-example"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:swoosh, "~> 1.3"},
      {:tesla, "~> 1.5"},
      {:hackney, "~> 1.9"},
      {:dialyxir, "~> 1.2", only: :dev, runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp docs() do
    [
      extras: [
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      groups_for_modules: groups_for_modules()
    ]
  end

  defp groups_for_modules() do
    [
      "Core API": [
        Resend.ApiKeys,
        Resend.Domains,
        Resend.Emails
      ],
      "Response Structs": [
        Resend.ApiKeys.ApiKey,
        Resend.Domains.Domain,
        Resend.Domains.Domain.Record,
        Resend.Emails.Email,
        Resend.Empty,
        Resend.Error,
        Resend.List
      ],
      Swoosh: [
        Resend.Swoosh.Adapter
      ],
      "API Client": [
        Resend.Client,
        Resend.Client.TeslaClient
      ],
      Utilities: [
        Resend.Util
      ]
    ]
  end
end
