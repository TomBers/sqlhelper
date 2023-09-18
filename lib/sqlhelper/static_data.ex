defmodule Sqlhelper.StaticData do
  alias Sqlhelper.Repo
  alias Sqlhelper.Tables.{Animals, Owners}
  alias Sqlhelper.Challenges.Challenge
  alias Sqlhelper.DataCheck

  def run do
    data_checks = Repo.all(DataCheck) |> IO.inspect()

    animal_data = [
      %{name: "Bella", type: "Dog", age: 5},
      %{name: "Max", type: "Cat", age: 3},
      %{name: "Charlie", type: "Bird", age: 2},
      %{name: "Milo", type: "Dog", age: 4},
      %{name: "Rocky", type: "Fish", age: 1}
    ]

    insert_data("animals", data_checks, animal_data, &insert_animals/1)

    # Insert owners
    owner_data = [
      %{name: "John", animal_id: 1},
      %{name: "Emma", animal_id: 2},
      %{name: "Oliver", animal_id: 3},
      %{name: "Ava", animal_id: 4},
      %{name: "Sophia", animal_id: 5}
    ]

    insert_data("owners", data_checks, owner_data, &insert_owners/1)

    # Insert challenges
    challenges_data = [
      %{
        title: "Challenge1",
        text: "Learn how to write basic SQL queries.",
        answer: "Answer1",
        difficulty: "Easy",
        hints: "SELECT * FROM table_name;",
        author_id: 1
      },
      %{
        title: "Challenge2",
        text: "Learn how to join tables in SQL.",
        answer: "Answer2",
        difficulty: "Medium",
        hints: "SELECT * FROM table1 JOIN table2 ON table1.id = table2.table1_id;",
        author_id: 1
      },
      %{
        title: "Challenge3",
        text: "Learn how to use aggregate functions in SQL.",
        answer: "Answer3",
        difficulty: "Hard",
        hints: "SELECT COUNT(*) FROM table_name;",
        author_id: 1
      }
    ]

    insert_data("challenges", data_checks, challenges_data, &insert_challenges/1)
  end

  defp insert_animals(animal_data) do
    animal_data
    |> Enum.map(&Repo.insert!(%Animals{} |> Ecto.Changeset.cast(&1, [:name, :type, :age])))
  end

  defp insert_owners(owner_data) do
    owner_data
    |> Enum.map(&Repo.insert!(%Owners{} |> Ecto.Changeset.cast(&1, [:name, :animal_id])))
  end

  defp insert_challenges(challenges_data) do
    challenges_data
    |> Enum.map(
      &Repo.insert!(
        %Challenge{}
        |> Ecto.Changeset.cast(&1, [:title, :text, :answer, :difficulty, :hints, :author_id])
      )
    )
  end

  defp insert_data(name, data_checks, static_data, insert_fn) do
    data_check = Enum.find(data_checks, &(&1.name == name))

    if data_check == nil or not data_check.inserted do
      static_data |> insert_fn.()

      dc =
        case Repo.get_by(DataCheck, name: name) do
          nil -> %DataCheck{name: name, inserted: true}
          dc -> %DataCheck{dc | inserted: true}
        end

      DataCheck.changeset(dc, %{name: name, inserted: true})
      |> Repo.insert_or_update!()
    end
  end
end
