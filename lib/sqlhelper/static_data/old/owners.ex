defmodule Sqlhelper.StaticData.Owners do
  alias Sqlhelper.Tables.Owners
  alias Sqlhelper.Repo

  def data do
    [
      %{name: "John", animal_id: 1},
      %{name: "Emma", animal_id: 2},
      %{name: "Oliver", animal_id: 3},
      %{name: "Ava", animal_id: 4},
      %{name: "Sophia", animal_id: 5}
    ]
  end

  def insert(owner_data) do
    owner_data
    |> Enum.map(&Repo.insert!(%Owners{} |> Ecto.Changeset.cast(&1, [:name, :animal_id])))
  end
end
