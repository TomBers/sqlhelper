defmodule Sqlhelper.StaticData.Statements do
  alias Sqlhelper.Tables.{Statements}
  alias Sqlhelper.Repo

  @test_crime 1
  @suspect_id 1
  @witness_id 1
  def data do
    1..5 |> Enum.map(fn _ -> statements_map(@test_crime, @suspect_id, @witness_id) end)
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
