defmodule Sqlhelper.Repo do
  use Ecto.Repo,
    otp_app: :sqlhelper,
    adapter: Ecto.Adapters.Postgres
end
