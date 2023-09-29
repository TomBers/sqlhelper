defmodule Sqlhelper.StaticData.Suspects do
  alias Sqlhelper.Tables.{Suspects, SuspectsMedia}
  alias Sqlhelper.Repo

  @test_crime 1
  def data do
    1..5 |> Enum.map(fn _ -> suspect_map(@test_crime) end)
  end

  defp suspect_map(crime_id) do
    %{
      name: Faker.Person.name(),
      dob: Faker.Date.between(~D[1971-01-01], ~D[2008-01-01]),
      height: Enum.random(["Short", "Tall", "Average"]),
      build: Enum.random(["Strong", "Weak", "Medium", "Massive", "Unusual", "Meager"]),
      hair_colour: Enum.random(["Black", "Red", "Blonde", "Brown", "Grey", "White", "Bald"]),
      ethnicity:
        Enum.random([
          "Asian, Asian British, Asian Welsh",
          "Black, Black British, Black Welsh, Caribbean or African",
          "Mixed or Multiple",
          "White",
          "Other ethnic group"
        ]),
      notes: Faker.Superhero.power(),
      crime_id: crime_id
    }
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
    # IO.inspect(media_data, label: "media_data")
    img_path = "/images/person.jpg"

    %SuspectsMedia{}
    |> SuspectsMedia.changeset(%{image_path: img_path, suspect_id: media_data.id})
    |> Repo.insert!()
  end
end
