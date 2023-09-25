defmodule Sqlhelper.Repo.Migrations.Evidence do
  use Ecto.Migration

  def change do
    create table(:evidence) do
      add :type, :string
      add :timestamp, :naive_datetime
      add :location_lat, :float
      add :location_long, :float
      add :notes, :string
      add :crime_id, references(:crimes, on_delete: :nothing)

      timestamps()
    end

    create index(:evidence, [:crime_id])

    create table(:evidence_media) do
      add :image_path, :string
      add :evidence_id, references(:evidence, on_delete: :nothing)

      timestamps()
    end

    create index(:evidence_media, [:evidence_id])
  end
end
