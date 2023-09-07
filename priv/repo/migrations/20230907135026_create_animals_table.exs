defmodule Sqlhelper.Repo.Migrations.CreateAnimalsTable do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name, :string
      add :type, :string
      add :age, :integer

      timestamps()
    end
  end
end
