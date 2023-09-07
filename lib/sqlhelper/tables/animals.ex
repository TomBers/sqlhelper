defmodule Sqlhelper.Tables.Animals do
  use Ecto.Schema

  schema "animals" do
    field :name, :string
    field :type, :string
    field :age, :integer

    timestamps()
  end
end
