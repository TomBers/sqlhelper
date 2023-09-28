defmodule Sqlhelper.Repo.Migrations.AddTasksToChallenge do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :instruction, :string
      add :hint, :string
      add :challenge_id, references(:challenges, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:challenge_id])
  end
end
