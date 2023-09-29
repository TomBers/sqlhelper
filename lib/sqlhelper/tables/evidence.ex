defmodule Sqlhelper.Tables.Evidence do
  use Ecto.Schema
  import Ecto.Changeset

  schema "evidence" do
    field :type, :string
    field :timestamp, :naive_datetime
    field :location_lat, :float
    field :location_long, :float
    field :notes, :string
    belongs_to :crime, Sqlhelper.Tables.Crimes

    timestamps()
  end

  def changeset(evidence, attrs) do
    evidence
    |> cast(attrs, [:type, :timestamp, :location_lat, :location_long, :notes, :crime_id])
    |> validate_required([:type, :timestamp, :location_lat, :location_long, :notes, :crime_id])
  end
end
