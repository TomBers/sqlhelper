defmodule Sqlhelper.DataCheck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "data_checks" do
    field :name, :string
    field :inserted, :boolean

    timestamps()
  end

  def changeset(data_check, attrs) do
    data_check
    |> cast(attrs, [:name, :inserted])
    |> validate_required([:name, :inserted])
  end
end
