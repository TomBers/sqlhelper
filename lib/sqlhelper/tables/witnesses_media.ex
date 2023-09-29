defmodule Sqlhelper.Tables.WitnessesMedia do
  use Ecto.Schema
  import Ecto.Changeset

  schema "witnesses_media" do
    field :image_path, :string
    belongs_to :witness, Sqlhelper.Tables.Witnesses

    timestamps()
  end

  def changeset(witnesses_media, attrs) do
    witnesses_media
    |> cast(attrs, [:image_path, :witness_id])
    |> validate_required([:image_path, :witness_id])
  end
end
