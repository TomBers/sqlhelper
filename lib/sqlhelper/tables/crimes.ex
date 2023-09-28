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

defmodule Sqlhelper.Tables.CrimesMedia do
  use Ecto.Schema

  schema "crimes_media" do
    field :image_path, :string

    belongs_to :crime, Sqlhelper.Tables.Crimes

    timestamps()
  end
end
