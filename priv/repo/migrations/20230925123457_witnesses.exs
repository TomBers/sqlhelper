defmodule Sqlhelper.Repo.Migrations.Witnesses do
  use Ecto.Migration

  def change do
    create table(:witnesses) do
      add :name, :string
      add :dob, :date
      add :relation_to_suspect, :string

      timestamps()
    end

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
      add :statement_text, :text

      timestamps()
    end
  end
end
