defmodule Sqlhelper.Repo.Migrations.StoreAllQueries do
  use Ecto.Migration

  def change do
    create table(:queries) do
      add :query, :text
      timestamps()
    end
  end
end
