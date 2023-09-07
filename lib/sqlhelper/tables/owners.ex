defmodule Sqlhelper.Tables.Owners do
  use Ecto.Schema

  schema "owners" do
    field :name, :string
    belongs_to :animal, Sqlhelper.Tables.Animals

    timestamps()
  end
end
