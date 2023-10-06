defmodule Sqlhelper.Repo.Migrations.Witnesses do
  use Ecto.Migration

  def change do
    create table(:witnesses) do
      add :name, :string
      add :dob, :date
      add :relation_to_suspect, :string
      add :image_path, :string

      timestamps()
    end

    create table(:statements) do
      add :timestamp, :naive_datetime
      add :location_lat, :float
      add :location_long, :float
      add :statement_text, :text

      add :witness_id, references(:witnesses, on_delete: :nothing)
      add :crime_id, references(:crimes, on_delete: :nothing)

      timestamps()
    end

    create index(:statements, [:witness_id])
    create index(:statements, [:crime_id])
  end
end
