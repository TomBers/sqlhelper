defmodule Sqlhelper.StaticData.Evidence do
  alias Sqlhelper.Tables.{Evidence, EvidenceMedia}
  alias Sqlhelper.Repo

  @test_crime 1
  def data do
    1..30 |> Enum.map(fn _ -> evidence_map(@test_crime) end)
  end

  defp evidence_map(crime_id) do
    %{
      type:
        Enum.random([
          "DNA",
          "Fingerprints",
          "Footprints",
          "Hair",
          "Fibres",
          "Blood",
          "Weapon",
          "Clothing",
          "Vehicle",
          "Other"
        ]),
      timestamp: Faker.DateTime.backward(360),
      location_lat: Faker.Address.latitude(),
      location_long: Faker.Address.longitude(),
      notes: Faker.Lorem.sentence(),
      crime_id: crime_id
    }
  end

  def insert(evidence_data) do
    evidence_data
    |> Enum.map(
      &(Repo.insert!(%Evidence{} |> Evidence.changeset(&1))
        |> insert_media())
    )
  end

  def insert_media(media_data) do
    # IO.inspect(media_data, label: "media_data")
    name = String.downcase(media_data.type)
    img_path = "/images/evidence/#{name}.jpeg"

    %EvidenceMedia{}
    |> EvidenceMedia.changeset(%{image_path: img_path, evidence_id: media_data.id})
    |> Repo.insert!()
  end
end
