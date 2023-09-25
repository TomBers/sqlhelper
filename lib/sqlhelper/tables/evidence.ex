defmodule Sqlhelper.Tables.Evidence do
  use Ecto.Schema

  schema "evidence" do
    field :type, :string
    field :timestamp, :naive_datetime
    field :location_lat, :float
    field :location_long, :float
    field :notes, :string
    belongs_to :crime, Sqlhelper.Tables.Crimes

    timestamps()
  end
end

defmodule Sqlhelper.Tables.EvidenceMedia do
  use Ecto.Schema

  schema "evidence_media" do
    field :image_path, :string
    belongs_to :evidence, Sqlhelper.Tables.Evidence

    timestamps()
  end
end
