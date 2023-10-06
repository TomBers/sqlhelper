defmodule Sqlhelper.StaticData.Statements do
  alias Sqlhelper.Tables.{Statements}
  alias Sqlhelper.Repo

  @crime_id 1

  def data do
    game_data()
  end

  defp game_data do
    [
      statements_map(@crime_id, 1, "The opening statement")
    ]
  end

  defp statements_map(crime_id, witness_id, statement) do
    %{
      timestamp: Faker.DateTime.backward(360),
      location_lat: Faker.Address.latitude(),
      location_long: Faker.Address.longitude(),
      statement_text: statement,
      witness_id: witness_id,
      crime_id: crime_id
    }
  end

  def insert(witness_data) do
    witness_data
    |> Enum.map(&Repo.insert!(%Statements{} |> Statements.changeset(&1)))
  end
end
