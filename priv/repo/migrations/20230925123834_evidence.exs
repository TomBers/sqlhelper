defmodule Sqlhelper.Repo.Migrations.Evidence do
  use Ecto.Migration

  def change do
    create table(:evidence) do
      add :type, :string
      add :image_path, :string
      add :timestamp, :naive_datetime
      add :location_lat, :float
      add :location_long, :float
      add :notes, :text

      add :crime_id, references(:crimes, on_delete: :nothing)
      add :suspect_id, references(:suspects, on_delete: :nothing)

      timestamps()
    end

    create index(:evidence, [:crime_id])
    create index(:evidence, [:suspect_id])
  end
end
