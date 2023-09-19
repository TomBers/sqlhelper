defmodule Sqlhelper.Repo do
  use Ecto.Repo,
    otp_app: :sqlhelper,
    adapter: Ecto.Adapters.Postgres

  # https://hexdocs.pm/ecto/Ecto.Repo.html#module-read-only-repositories
  # , read_only: true
end
