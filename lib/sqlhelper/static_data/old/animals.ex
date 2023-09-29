defmodule Sqlhelper.StaticData.Animals do
  alias Sqlhelper.Tables.Animals
  alias Sqlhelper.Repo

  def data do
    [
      %{name: "Bella", type: "Dog", age: 5},
      %{name: "Max", type: "Cat", age: 3},
      %{name: "Charlie", type: "Bird", age: 2},
      %{name: "Milo", type: "Dog", age: 4},
      %{name: "Rocky", type: "Fish", age: 1}
    ]
  end

  def insert(animal_data) do
    animal_data
    |> Enum.map(&Repo.insert!(%Animals{} |> Ecto.Changeset.cast(&1, [:name, :type, :age])))
  end
end
