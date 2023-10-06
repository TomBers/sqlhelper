defmodule Sqlhelper.Tables.Crimes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "crimes" do
    field :title, :string
    field :summary, :string
    field :description, :string

    timestamps()
  end

  def changeset(crime, attrs) do
    crime
    |> cast(attrs, [:title, :summary, :description])
    |> validate_required([:title, :summary, :description])
  end
end
