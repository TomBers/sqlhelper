defmodule Sqlhelper.Repo.Migrations.CreateChallenges do
  use Ecto.Migration

  def change do
    create table(:authors) do
      add :name, :string

      timestamps()
    end

    create table(:challenges) do
      add :title, :string
      add :text, :string
      add :answer, :string
      add :difficulty, :string
      add :hints, :string
      add :author_id, references(:authors, on_delete: :nothing)

      timestamps()
    end

    create index(:challenges, [:author_id])
  end
end
