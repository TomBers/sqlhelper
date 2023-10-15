defmodule Sqlhelper.StaticData.Evidence do
  alias Sqlhelper.Tables.Evidence
  alias Sqlhelper.Repo

  @test_crime 1
  def data(killer) do
    suspects = Repo.all(Sqlhelper.Tables.Suspects)

    other_evidence = suspects |> Enum.flat_map(fn suspect -> gen_evidence(suspect) end)

    Enum.shuffle(other_evidence ++ [add_killer_evidence(killer)])
  end

  defp gen_evidence(suspect) do
    1..Enum.random([1, 2, 3])
    |> Enum.map(fn _ ->
      type = get_evidence_type()
      notes = get_evidence_notes(type)
      evidence_map(@test_crime, suspect.id, type, notes)
    end)
  end

  defp evidence_map(crime_id, suspect_id, type, notes) do
    %{
      type: type,
      image_path: "/images/evidence/#{String.downcase(type)}.jpeg",
      timestamp: Faker.DateTime.backward(360),
      location_lat: Faker.Address.latitude(),
      location_long: Faker.Address.longitude(),
      notes: notes,
      crime_id: crime_id,
      suspect_id: suspect_id
    }
  end

  defp add_killer_evidence(killer) do
    evidence_map(@test_crime, killer.id, "DNA", "Found at the scene")
  end

  defp get_evidence_type do
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
      "CCTV footage",
      "Mobile phone picture"
    ])
  end

  def get_evidence_notes(type) do
    case type do
      "Weapon" ->
        Enum.random(["Found at the scene", "Found at the suspect's home"])

      "Vehicle" ->
        Enum.random(["Found at the scene", "Parked near the scene"])

      "CCTV footage" ->
        Enum.random([
          "Footage suggests the suspect was at the scene",
          "Footage suggests the suspect was near the scene"
        ])

      "Mobile phone picture" ->
        Enum.random([
          "Picture suggests the suspect was at the scene",
          "Picture suggests the suspect was near the scene"
        ])

      _ ->
        Enum.random([
          "Found at the scene",
          "Found in the proximity of the scene",
          "Is compromised, but found at the scene"
        ])
    end
  end

  def insert(evidence_data) do
    evidence_data
    |> Enum.map(&Repo.insert!(%Evidence{} |> Evidence.changeset(&1)))
  end
end
