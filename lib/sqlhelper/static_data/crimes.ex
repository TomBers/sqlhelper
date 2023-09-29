defmodule Sqlhelper.StaticData.Crimes do
  alias Sqlhelper.Tables.{Crimes, CrimesMedia}
  alias Sqlhelper.Repo

  @test_crime 1
  def data do
    1..5 |> Enum.map(fn _ -> crime_map(@test_crime) end)
  end

  defp crime_map(crime_id) do
    %{
      title: Faker.Lorem.sentence(),
      summary: Faker.Lorem.sentence(),
      description: Faker.Lorem.sentence(),
      crime_id: crime_id
    }
  end

  def insert(crime_data) do
    crime_data
    |> Enum.map(
      &(Repo.insert!(%Crimes{} |> Crimes.changeset(&1))
        |> insert_media())
    )
  end

  def insert_media(media_data) do
    # IO.inspect(media_data, label: "media_data")
    img_path = "/images/doc.png"

    %CrimesMedia{}
    |> CrimesMedia.changeset(%{image_path: img_path, crime_id: media_data.id})
    |> Repo.insert!()
  end
end
