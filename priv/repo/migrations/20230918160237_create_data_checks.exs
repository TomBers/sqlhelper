defmodule Sqlhelper.Repo.Migrations.CreateDataChecks do
  use Ecto.Migration

  def change do
    create table(:data_checks) do
      add :name, :string
      add :inserted, :boolean, default: false

      timestamps()
    end
  end
end
