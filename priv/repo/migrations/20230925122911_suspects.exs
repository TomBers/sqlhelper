defmodule Sqlhelper.Repo.Migrations.Suspects do
  use Ecto.Migration

  def change do
    create table(:suspects) do
      add :name, :string
      add :dob, :date
      add :height, :string
      add :build, :string
      add :hair_colour, :string
      add :ethnicity, :string
      add :notes, :text
      add :crime_id, references(:crimes, on_delete: :nothing)

      timestamps()
    end

    create index(:suspects, [:crime_id])

    create table(:suspects_media) do
      add :image_path, :string
      add :suspect_id, references(:suspects, on_delete: :nothing)

      timestamps()
    end

    create index(:suspects_media, [:suspect_id])
  end
end
