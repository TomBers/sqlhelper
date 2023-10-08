defmodule Sqlhelper.Tables.Suspects do
  use Ecto.Schema
  import Ecto.Changeset

  schema "suspects" do
    field :image_path, :string
    field :name, :string
    field :dob, :date
    field :height, :integer
    field :build, :string
    field :hair_colour, :string
    field :gender, :string
    field :ethnicity, :string
    field :notes, :string
    belongs_to :crime, Sqlhelper.Tables.Crimes

    timestamps()
  end

  def changeset(suspect, attrs) do
    suspect
    |> cast(attrs, [
      :image_path,
      :name,
      :dob,
      :height,
      :build,
      :hair_colour,
      :gender,
      :ethnicity,
      :notes,
      :crime_id
    ])
    |> validate_required([
      :image_path,
      :name,
      :dob,
      :height,
      :build,
      :hair_colour,
      :gender,
      :ethnicity,
      :notes,
      :crime_id
    ])
  end
end
