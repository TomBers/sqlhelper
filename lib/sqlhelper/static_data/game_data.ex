defmodule Sqlhelper.GameData do
  alias Sqlhelper.Repo
  alias Sqlhelper.Tables.{Crimes, Suspects, Witnesses, Statements, Evidence}

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
end
