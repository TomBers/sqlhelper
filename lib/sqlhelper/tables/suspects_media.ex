defmodule Sqlhelper.Tables.SuspectsMedia do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suspects_media" do
    field :image_path, :string
    belongs_to :suspect, Sqlhelper.Tables.Suspects

    timestamps()
  end

  def changeset(suspects_media, attrs) do
    suspects_media
    |> cast(attrs, [:image_path, :suspect_id])
    |> validate_required([:image_path, :suspect_id])
  end
end
