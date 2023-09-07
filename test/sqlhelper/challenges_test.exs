defmodule Sqlhelper.ChallengesTest do
  use Sqlhelper.DataCase

  alias Sqlhelper.Challenges

  describe "challenges" do
    alias Sqlhelper.Challenges.Challenge

    import Sqlhelper.ChallengesFixtures

    @invalid_attrs %{answer: nil, difficulty: nil, hints: nil, text: nil, title: nil}

    test "list_challenges/0 returns all challenges" do
      challenge = challenge_fixture()
      assert Challenges.list_challenges() == [challenge]
    end

    test "get_challenge!/1 returns the challenge with given id" do
      challenge = challenge_fixture()
      assert Challenges.get_challenge!(challenge.id) == challenge
    end

    test "create_challenge/1 with valid data creates a challenge" do
      valid_attrs = %{answer: "some answer", difficulty: "some difficulty", hints: "some hints", text: "some text", title: "some title"}

      assert {:ok, %Challenge{} = challenge} = Challenges.create_challenge(valid_attrs)
      assert challenge.answer == "some answer"
      assert challenge.difficulty == "some difficulty"
      assert challenge.hints == "some hints"
      assert challenge.text == "some text"
      assert challenge.title == "some title"
    end

    test "create_challenge/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Challenges.create_challenge(@invalid_attrs)
    end

    test "update_challenge/2 with valid data updates the challenge" do
      challenge = challenge_fixture()
      update_attrs = %{answer: "some updated answer", difficulty: "some updated difficulty", hints: "some updated hints", text: "some updated text", title: "some updated title"}

      assert {:ok, %Challenge{} = challenge} = Challenges.update_challenge(challenge, update_attrs)
      assert challenge.answer == "some updated answer"
      assert challenge.difficulty == "some updated difficulty"
      assert challenge.hints == "some updated hints"
      assert challenge.text == "some updated text"
      assert challenge.title == "some updated title"
    end

    test "update_challenge/2 with invalid data returns error changeset" do
      challenge = challenge_fixture()
      assert {:error, %Ecto.Changeset{}} = Challenges.update_challenge(challenge, @invalid_attrs)
      assert challenge == Challenges.get_challenge!(challenge.id)
    end

    test "delete_challenge/1 deletes the challenge" do
      challenge = challenge_fixture()
      assert {:ok, %Challenge{}} = Challenges.delete_challenge(challenge)
      assert_raise Ecto.NoResultsError, fn -> Challenges.get_challenge!(challenge.id) end
    end

    test "change_challenge/1 returns a challenge changeset" do
      challenge = challenge_fixture()
      assert %Ecto.Changeset{} = Challenges.change_challenge(challenge)
    end
  end
end
