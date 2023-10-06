defmodule Sqlhelper.StaticData.Crimes do
  alias Sqlhelper.Tables.Crimes
  alias Sqlhelper.Repo

  @test_crime 1
  def data do
    [crime_map(@test_crime)]
  end

  defp crime_map(crime_id) do
    %{
      title: "[Murder case]",
      summary: "Last thursday, #{Faker.Person.name()} was found dead in their home.",
      description:
        "The crime was dressed up to look like a bugulary, however witness statements and evidence point to something more ",
      crime_id: crime_id
    }
  end

  def insert(crime_data) do
    crime_data
    |> Enum.map(&Repo.insert!(%Crimes{} |> Crimes.changeset(&1)))
  end
end
