defmodule Sqlhelper.StaticData do
  alias Sqlhelper.Repo
  alias Sqlhelper.Tables.{Animals, Owners}

  def run do
    [
      %{name: "Bella", type: "Dog", age: 5},
      %{name: "Max", type: "Cat", age: 3},
      %{name: "Charlie", type: "Bird", age: 2},
      %{name: "Milo", type: "Dog", age: 4},
      %{name: "Rocky", type: "Fish", age: 1}
    ]
    |> Enum.map(&Repo.insert!(%Animals{} |> Ecto.Changeset.cast(&1, [:name, :type, :age])))

    # Insert owners
    [
      %{name: "John", animal_id: 1},
      %{name: "Emma", animal_id: 2},
      %{name: "Oliver", animal_id: 3},
      %{name: "Ava", animal_id: 4},
      %{name: "Sophia", animal_id: 5}
    ]
    |> Enum.map(&Repo.insert!(%Owners{} |> Ecto.Changeset.cast(&1, [:name, :animal_id])))
  end
end
