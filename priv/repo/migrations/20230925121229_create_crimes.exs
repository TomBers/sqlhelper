defmodule Sqlhelper.Repo.Migrations.CreateCrimes do
  use Ecto.Migration

  def change do
    create table(:crimes) do
      add :title, :string
      add :summary, :string
      add :description, :text

      timestamps()
    end

    create table(:crimes_media) do
      add :image_path, :string
      add :crime_id, references(:crimes, on_delete: :nothing)

      timestamps()
    end

    create index(:crimes_media, [:crime_id])
  end
end
