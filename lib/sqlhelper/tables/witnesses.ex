defmodule Sqlhelper.Tables.Witnesses do
  use Ecto.Schema
  import Ecto.Changeset

  schema "witnesses" do
    field :name, :string
    field :dob, :date
    field :relation_to_suspect, :string
    belongs_to :suspect, Sqlhelper.Tables.Suspects

    timestamps()
  end

  def changeset(witness, attrs) do
    witness
    |> cast(attrs, [:name, :dob, :relation_to_suspect, :suspect_id])
    |> validate_required([:name, :dob, :relation_to_suspect, :suspect_id])
  end
end
