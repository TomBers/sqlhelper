defmodule Sqlhelper.Tables.Crimes do
  use Ecto.Schema
  import Ecto.Changeset

  alias Sqlhelper.Tables.CrimesMedia

  schema "crimes" do
    field :title, :string
    field :summary, :string
    field :description, :string

    has_many :crimes_media, CrimesMedia, foreign_key: :crime_id

    timestamps()
  end

  def changeset(crime, attrs) do
    crime
    |> cast(attrs, [:title, :summary, :description])
    |> validate_required([:title, :summary, :description])
  end
end
