defmodule Sqlhelper.StaticData.Suspects do
  alias Sqlhelper.Tables.{Suspects, SuspectsMedia}
  alias Sqlhelper.Repo

  def data do
    [
      %{
        name: Enum.random(["Suspect 1", "Suspect 2", "Suspect 3"]),
        dob: Enum.random([~D[2000-01-01]]),
        height: Enum.random(["Short", "Tall", "Medium"]),
        build: Enum.random(["Strong", "Weak", "Medium"]),
        hair_colour: Enum.random(["Black", "Red", "Blonde"]),
        ethnicity: "2",
        notes: "Notes 2",
        crime_id: 2
      }
    ]
  end

  def insert(suspect_data) do
    IO.inspect(suspect_data, label: "suspect_data")

    suspect_data
    |> Enum.map(
      &(Repo.insert!(%Suspects{} |> Suspects.changeset(&1))
        |> insert_media())
    )
  end

  def insert_media(media_data) do
    IO.inspect(media_data, label: "media_data")
    img_path = "/images/person.jpg"

    %SuspectsMedia{}
    |> SuspectsMedia.changeset(%{image_path: img_path, suspect_id: media_data.id})
    |> IO.inspect(label: "SuspectsMedia.changeset")
    |> Repo.insert!()
  end
end
