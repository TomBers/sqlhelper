defmodule Sqlhelper.Tables.Suspects do
  use Ecto.Schema

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
end

defmodule Sqlhelper.Tables.SuspectsMedia do
  use Ecto.Schema

  schema "suspects_media" do
    field :image_path, :string
    belongs_to :suspect, Sqlhelper.Tables.Suspects

    timestamps()
  end
end
