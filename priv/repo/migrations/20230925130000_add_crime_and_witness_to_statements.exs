defmodule Sqlhelper.Repo.Migrations.AddCrimeAndWitnessToStatements do
  use Ecto.Migration

  def change do
    alter table(:statements) do
      add :witness_id, references(:witnesses, on_delete: :nothing)
      add :crime_id, references(:crimes, on_delete: :nothing)
    end

    create index(:statements, [:witness_id])
    create index(:statements, [:crime_id])
  end
end
