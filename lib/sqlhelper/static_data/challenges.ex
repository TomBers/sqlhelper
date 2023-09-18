defmodule Sqlhelper.StaticData.Challenges do
  alias Sqlhelper.Challenges.Challenge
  alias Sqlhelper.Repo

  def data do
    [
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
  end

  def insert(challenges_data) do
    challenges_data
    |> Enum.map(
      &Repo.insert!(
        %Challenge{}
        |> Ecto.Changeset.cast(&1, [:title, :text, :answer, :difficulty, :hints, :author_id])
      )
    )
  end
end
