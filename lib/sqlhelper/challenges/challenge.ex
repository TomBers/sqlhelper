defmodule Sqlhelper.Challenges.Challenge do
  use Ecto.Schema
  import Ecto.Changeset

  schema "challenges" do
    field :answer, :string
    field :difficulty, :string
    field :hints, :string
    field :text, :string
    field :title, :string
    field :author_id, :id

    timestamps()
  end

  @doc false
  def changeset(challenge, attrs) do
    challenge
    |> cast(attrs, [:title, :text, :answer, :difficulty, :hints])
    |> validate_required([:title, :text, :answer, :difficulty, :hints])
  end
end
