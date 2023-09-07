defmodule Sqlhelper.Repo.Migrations.CreateTestTable do
  use Ecto.Migration

  def change do
    create table(:test_table) do
      add :name, :string
      add :value, :integer

      timestamps()
    end
  end
end
