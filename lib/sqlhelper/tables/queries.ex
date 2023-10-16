defmodule Sqlhelper.Tables.Queries do
  use Ecto.Schema
  import Ecto.Changeset

  schema "queries" do
    field :query, :string

    timestamps()
  end

  def changeset(query, attrs) do
    query
    |> cast(attrs, [:query])
    |> validate_required([:query])
  end
end
