defmodule Sqlhelper.Tables.Crimes do
  use Ecto.Schema

  alias Sqlhelper.Tables.CrimesMedia

  schema "crimes" do
    field :title, :string
    field :summary, :string
    field :description, :string

    has_many :crimes_media, CrimesMedia, foreign_key: :crime_id

    timestamps()
  end
end
