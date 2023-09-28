defmodule Sqlhelper.Challenges.Tasks do
  use Ecto.Schema

  schema "tasks" do
    field :instruction, :string
    field :hint, :string
    belongs_to :challenge, Sqlhelper.Challenges.Challenge

    timestamps()
  end
end
