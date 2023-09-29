defmodule Sqlhelper.Tables.Suspects do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suspects" do
    field :name, :string
    field :dob, :date
    field :height, :string
    field :build, :string
    field :hair_colour, :string
    field :ethnicity, :string
    field :notes, :string
    belongs_to :crime, Sqlhelper.Tables.Crimes
    has_many :suspects_media, Sqlhelper.Tables.SuspectsMedia, foreign_key: :suspect_id

    timestamps()
  end

  def changeset(suspect, attrs) do
    suspect
    |> cast(attrs, [:name, :dob, :height, :build, :hair_colour, :ethnicity, :notes, :crime_id])
    |> validate_required([
      :name,
      :dob,
      :height,
      :build,
      :hair_colour,
      :ethnicity,
      :notes,
      :crime_id
    ])
  end
end
