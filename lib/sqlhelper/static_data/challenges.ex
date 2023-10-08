defmodule Sqlhelper.StaticData.Challenges do
  alias Sqlhelper.Challenges.{Challenge, Tasks}
  alias Sqlhelper.Repo

  def data do
    [
      %{
        title: "Challenge 1",
        text: "Discover the mostly likely suspect from the evidence provided.",
        answer: "Answer1",
        difficulty: "Easy",
        hints: "",
        author_id: 1
      }
    ]
  end

  def insert(challenges_data) do
    challenges_data
    |> Enum.map(
      &(Repo.insert!(
          %Challenge{}
          |> Ecto.Changeset.cast(&1, [:title, :text, :answer, :difficulty, :hints, :author_id])
        )
        |> insert_tasks())
    )
  end

  def insert_tasks(challenge) do
    data = [
      %{
        instruction: "Find the details of the case",
        hint: "Look at the crimes table to find a open cases",
        challenge_id: challenge.id
      },
      %{
        instruction: "See the current suspects",
        hint: "Join on the suspects table with suspects media to see the suspects",
        challenge_id: challenge.id
      },
      %{
        instruction: "Look at the evidence of the case",
        hint: "Look at the evidence table",
        challenge_id: challenge.id
      },
      %{
        instruction: "Look at the statements relates to the case",
        hint: "Look at the statements table",
        challenge_id: challenge.id
      }
    ]

    data
    |> Enum.map(
      &Repo.insert!(
        %Tasks{}
        |> Ecto.Changeset.cast(&1, [:instruction, :hint, :challenge_id])
      )
    )
  end
end
