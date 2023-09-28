defmodule Sqlhelper.Tables.CrimesMedia do
  use Ecto.Schema
  import Ecto.Changeset

  schema "crimes_media" do
    field :image_path, :string

    belongs_to :crime, Sqlhelper.Tables.Crimes

    timestamps()
  end

  def changeset(crimes_media, attrs) do
    crimes_media
    |> cast(attrs, [:image_path, :crime_id])
    |> validate_required([:image_path, :crime_id])
  end
end
