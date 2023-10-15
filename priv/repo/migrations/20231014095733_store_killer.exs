defmodule Sqlhelper.Repo.Migrations.StoreKiller do
  use Ecto.Migration

  def change do
    create table(:killers) do
      add :crime_id, references(:crimes, on_delete: :delete_all), null: false
      add :killer, :text, null: false

      timestamps()
    end
  end
end
