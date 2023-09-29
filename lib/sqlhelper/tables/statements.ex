defmodule Sqlhelper.Tables.Statements do
  use Ecto.Schema
  import Ecto.Changeset

  schema "statements" do
    field :timestamp, :naive_datetime
    field :location_lat, :float
    field :location_long, :float
    field :statement_text, :string
    belongs_to :suspect, Sqlhelper.Tables.Suspects
    belongs_to :witness, Sqlhelper.Tables.Witnesses
    belongs_to :crime, Sqlhelper.Tables.Crimes

    timestamps()
  end

  def changeset(statement, attrs) do
    statement
    |> cast(attrs, [
      :timestamp,
      :location_lat,
      :location_long,
      :statement_text,
      :suspect_id,
      :witness_id,
      :crime_id
    ])
    |> validate_required([
      :timestamp,
      :location_lat,
      :location_long,
      :statement_text,
      :suspect_id,
      :witness_id,
      :crime_id
    ])
  end
end
