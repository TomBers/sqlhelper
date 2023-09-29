defmodule Sqlhelper.StaticData.Witnesses do
  alias Sqlhelper.Tables.{Witnesses, WitnessesMedia}
  alias Sqlhelper.Repo

  @test_crime 1
  @suspect_id 1
  def data do
    1..5 |> Enum.map(fn _ -> witness_map(@test_crime, @suspect_id) end)
  end

  defp witness_map(crime_id, suspect_id) do
    %{
      name: Faker.Person.name(),
      dob: Faker.Date.between(~D[1971-01-01], ~D[2008-01-01]),
      relation_to_suspect: Enum.random(["Friend", "Family", "Colleague", "Other"]),
      suspect_id: suspect_id,
      crime_id: crime_id
    }
  end

  def insert(witness_data) do
    witness_data
    |> Enum.map(
      &(Repo.insert!(%Witnesses{} |> Witnesses.changeset(&1))
        |> insert_media())
    )
  end

  def insert_media(media_data) do
    # IO.inspect(media_data, label: "media_data")
    img_path = "/images/person.jpg"

    %WitnessesMedia{}
    |> WitnessesMedia.changeset(%{image_path: img_path, witness_id: media_data.id})
    |> Repo.insert!()
  end
end
