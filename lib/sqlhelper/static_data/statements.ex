defmodule Sqlhelper.StaticData.Statements do
  alias Sqlhelper.Tables.{Statements}
  alias Sqlhelper.Repo

  @crime_id 1
  @suspect_id 1
  @witness_id 1
  def data do
    game_data()
  end

  defp game_data do
    [
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "I noticed Aiden near the crime scene shortly before the incident. He looked quite agitated and was pacing back and forth.",
        suspect_id: 1,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Aiden was with a group of us discussing the charity auction when we heard about the murder. He seemed as shocked as everyone else.",
        suspect_id: 1,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "I saw Liliana near the conservatory right before the murder happened. She was holding a small vial of some liquid; it looked sinister.",
        suspect_id: 2,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Liliana was with me in the library when we heard the scream. She seemed genuinely shocked and scared.",
        suspect_id: 2,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Sebastian always had a cold demeanor. On the night of the murder, I saw him lurking around the hallway, his face was emotionless even after hearing about the murder.",
        suspect_id: 3,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Sebastian was hosting a charity event that night. He was surrounded by people when the crime occurred.",
        suspect_id: 3,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "I overheard Valeria having a heated argument with the victim earlier that day. She looked furious.",
        suspect_id: 4,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Valeria was performing a protective ritual for some guests at the time of the murder. She was in full view of several people.",
        suspect_id: 4,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "I saw Dmitri near the crime scene looking very anxious and constantly checking his watch.",
        suspect_id: 5,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Dmitri was playing chess with me when we were interrupted by the news of the murder. He looked shocked.",
        suspect_id: 5,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Amara was seen arguing with the victim a day before. She has this eerie way of handling snakes; who knows what she is capable of.",
        suspect_id: 6,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Amara was helping me with snakebite first aid training during the time the crime supposedly occurred.",
        suspect_id: 6,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "I saw Raphael near the victim's safe a few hours before the murder. He seemed to be fiddling with the lock.",
        suspect_id: 7,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Raphael was entertaining guests with his piano skills all evening. He was nowhere near the crime scene.",
        suspect_id: 7,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "I saw Fiona leaving the victim's room with a stern face just hours before the crime.",
        suspect_id: 8,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Fiona was at the family dinner, sitting right across from me when we were notified of the murder.",
        suspect_id: 8,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Ezra has the skill to deceive anyone with his illusions. I saw him near the victim before the crime.",
        suspect_id: 9,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Ezra was showing magic tricks to the children in the drawing-room when the incident happened.",
        suspect_id: 9,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "I saw Bianca arguing with the victim the night before. She looked really upset.",
        suspect_id: 10,
        witness_id: @witness_id,
        crime_id: @crime_id
      },
      %{
        timestamp: Faker.DateTime.backward(360),
        location_lat: Faker.Address.latitude(),
        location_long: Faker.Address.longitude(),
        statement_text:
          "Bianca was teaching a dance class to some guests during the time the murder took place. Many people can vouch for her.",
        suspect_id: 10,
        witness_id: @witness_id,
        crime_id: @crime_id
      }
    ]
  end

  defp statements_map(crime_id, suspect_id, witness_id) do
    %{
      timestamp: Faker.DateTime.backward(360),
      location_lat: Faker.Address.latitude(),
      location_long: Faker.Address.longitude(),
      statement_text: Faker.Lorem.sentence(),
      suspect_id: suspect_id,
      witness_id: witness_id,
      crime_id: crime_id
    }
  end

  def insert(witness_data) do
    witness_data
    |> Enum.map(&Repo.insert!(%Statements{} |> Statements.changeset(&1)))
  end
end
