defmodule Sqlhelper.StaticData.Witnesses do
  alias Sqlhelper.Tables.Witnesses
  alias Sqlhelper.Repo

  @test_crime 1
  def data do
    1..5 |> Enum.map(fn _ -> witness_map(@test_crime) end)
  end

  defp witness_map(crime_id) do
    %{
      name: Faker.Person.name(),
      dob: Faker.Date.between(~D[1971-01-01], ~D[2008-01-01]),
      relation_to_suspect: Enum.random(["Friend", "Family", "Colleague", "Other"]),
      crime_id: crime_id,
      image_path: "/images/person.jpg"
    }
  end

  def insert(witness_data) do
    witness_data
    |> Enum.map(&Repo.insert!(%Witnesses{} |> Witnesses.changeset(&1)))
  end
end
