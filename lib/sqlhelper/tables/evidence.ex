defmodule Sqlhelper.Tables.Evidence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "evidence" do
    field :type, :string
    field :image_path, :string
    field :timestamp, :naive_datetime
    field :location_lat, :float
    field :location_long, :float
    field :notes, :string
    belongs_to :crime, Sqlhelper.Tables.Crimes
    belongs_to :suspect, Sqlhelper.Tables.Suspects, foreign_key: :suspect_id

    timestamps()
  end

  def changeset(evidence, attrs) do
    evidence
    |> cast(attrs, [
      :type,
      :image_path,
      :timestamp,
      :location_lat,
      :location_long,
      :notes,
      :crime_id,
      :suspect_id
    ])
    |> validate_required([
      :type,
      :image_path,
      :timestamp,
      :location_lat,
      :location_long,
      :notes,
      :crime_id,
      :suspect_id
    ])
  end
end
