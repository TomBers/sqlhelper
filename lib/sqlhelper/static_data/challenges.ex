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
        instruction: "#{challenge.id} Instruction 1",
        hint: "#{challenge.id} Hint 1",
        challenge_id: challenge.id
      },
      %{
        instruction: "#{challenge.id} Instruction 2",
        hint: "#{challenge.id} Hint 2",
        challenge_id: challenge.id
      },
      %{
        instruction: "#{challenge.id} Instruction 3",
        hint: "#{challenge.id} Hint 3",
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
