defmodule Sqlhelper.Tables.Witnesses do
  use Ecto.Schema

  schema "witnesses" do
    field :name, :string
    field :dob, :date
    field :relation_to_suspect, :string
    belongs_to :suspect, Sqlhelper.Tables.Suspects

    timestamps()
  end
end

defmodule Sqlhelper.Tables.WitnessesMedia do
  use Ecto.Schema

  schema "witnesses_media" do
    field :image_path, :string
    belongs_to :witness, Sqlhelper.Tables.Witnesses

    timestamps()
  end
end

defmodule Sqlhelper.Tables.Statements do
  use Ecto.Schema

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
end
