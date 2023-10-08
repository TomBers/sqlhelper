defmodule Sqlhelper.Repo.Migrations.Suspects do
  use Ecto.Migration

  def change do
    create table(:suspects) do
      add :image_path, :string
      add :name, :string
      add :dob, :date
      add :height, :integer
      add :build, :string
      add :hair_colour, :string
      add :gender, :string
      add :ethnicity, :string
      add :notes, :text
      add :crime_id, references(:crimes, on_delete: :nothing)

      timestamps()
    end

    create index(:suspects, [:crime_id])
  end
end
