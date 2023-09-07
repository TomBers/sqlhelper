defmodule Sqlhelper.ChallengesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Sqlhelper.Challenges` context.
  """

  @doc """
  Generate a challenge.
  """
  def challenge_fixture(attrs \\ %{}) do
    {:ok, challenge} =
      attrs
      |> Enum.into(%{
        answer: "some answer",
        difficulty: "some difficulty",
        hints: "some hints",
        text: "some text",
        title: "some title"
      })
      |> Sqlhelper.Challenges.create_challenge()

    challenge
  end
end
