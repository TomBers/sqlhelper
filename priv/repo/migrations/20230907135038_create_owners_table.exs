defmodule Sqlhelper.Repo.Migrations.CreateOwnersTable do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :name, :string
      add :animal_id, references(:animals)

      timestamps()
    end
  end
end
