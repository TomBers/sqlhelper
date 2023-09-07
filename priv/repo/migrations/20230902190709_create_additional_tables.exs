defmodule Sqlhelper.Repo.Migrations.CreateAdditionalTables do
  use Ecto.Migration

  def change do
    create table(:test_table2) do
      add :name, :string
      add :test_table_id, references(:test_table)

      timestamps()
    end

    create table(:test_table3) do
      add :value, :string
      add :test_table2_id, references(:test_table2)

      timestamps()
    end
  end
end
