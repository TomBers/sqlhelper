defmodule Sqlhelper.Repo.Migrations.Witnesses do
  use Ecto.Migration

  def change do
    create table(:witnesses) do
      add :name, :string
      add :dob, :date
      add :relation_to_suspect, :string
      add :suspect_id, references(:suspects, on_delete: :nothing)

      timestamps()
    end

    create index(:witnesses, [:suspect_id])

    create table(:witnesses_media) do
      add :image_path, :string
      add :witness_id, references(:witnesses, on_delete: :nothing)

      timestamps()
    end

    create index(:witnesses_media, [:witness_id])

    create table(:statements) do
      add :timestamp, :naive_datetime
      add :location_lat, :float
      add :location_long, :float
      add :statement_text, :string
      add :suspect_id, references(:suspects, on_delete: :nothing)

      timestamps()
    end

    create index(:statements, [:suspect_id])
  end
end
