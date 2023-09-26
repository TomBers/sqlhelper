defmodule Sqlhelper.Tables.Crimes do
  use Ecto.Schema

  schema "crimes" do
    field :title, :string
    field :summary, :string
    field :description, :string

    has_many :crimes_media, Sqlhelper.Tables.CrimesMedia

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
