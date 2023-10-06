defmodule Sqlhelper.Repo.Migrations.CreateCrimes do
  use Ecto.Migration

  def change do
    create table(:crimes) do
      add :title, :string
      add :summary, :string
      add :description, :text

      timestamps()
    end
  end
end
