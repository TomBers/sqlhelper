defmodule Sqlhelper.GameData do
  alias Sqlhelper.Repo
  alias Sqlhelper.Tables.{Crimes, Suspects, SuspectsMedia, Witnesses, Statements, Evidence}

  def generate_data do
    # Generate data for Crimes
    %Crimes{
      title: "Crime_1",
      summary: "first summary",
      description: "Description 1"
    }
    |> Repo.insert!()

    # Generate data for Suspects
    %Suspects{
      name: "Suspect 1",
      dob: ~D[2000-01-01],
      height: "Tall",
      build: "Strong",
      hair_colour: "Black",
      ethnicity: "Ethnicity 1",
      notes: "Notes 1",
      crime_id: 1
    }
    |> Repo.insert!()

    # Generate data for Witnesses
    %Witnesses{
      name: "Witness 1",
      dob: ~D[2000-01-01],
      relation_to_suspect: "Relation 1",
      suspect_id: 1
    }
    |> Repo.insert!()

    # Generate data for Statements
    %Statements{
      timestamp: ~N[2022-01-01T00:00:00],
      location_lat: 12.34,
      location_long: 56.78,
      statement_text: "Statement 1",
      suspect_id: 1
    }
    |> Repo.insert!()

    # Generate data for Evidence
    %Evidence{
      type: "Type 1",
      timestamp: ~N[2022-01-01T00:00:00],
      location_lat: 12.34,
      location_long: 56.78,
      notes: "Notes 1",
      crime_id: 1
    }
    |> Repo.insert!()
  end

  def gen_suspect(crime_id) do
    generate_suspect(
      crime_id,
      "/images/person.jpg",
      %{
        name: Enum.random(["Suspect 1", "Suspect 2", "Suspect 3"]),
        dob: Enum.random([~D[2000-01-01]]),
        height: Enum.random(["Short", "Tall", "Medium"]),
        build: Enum.random(["Strong", "Weak", "Medium"]),
        hair_colour: Enum.random(["Black", "Red", "Blonde"]),
        ethnicity: "Ethnicity 1",
        notes: "Notes 1"
      }
    )
  end

  defp generate_suspect(crime_id, img_path, attrs) do
    suspect =
      %Suspects{}
      |> Suspects.changeset(Map.put(attrs, :crime_id, crime_id))
      |> Repo.insert!()

    %SuspectsMedia{}
    |> SuspectsMedia.changeset(%{image_path: img_path, suspect_id: suspect.id})
    |> Repo.insert!()
  end
end
