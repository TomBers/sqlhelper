defmodule Sqlhelper.StaticData do
  alias Sqlhelper.Repo

  alias Sqlhelper.DataCheck
  # alias Sqlhelper.StaticData.Animals
  # alias Sqlhelper.StaticData.Owners
  alias Sqlhelper.StaticData.{
    Author,
    Challenges,
    Suspects,
    Crimes,
    Evidence,
    Witnesses,
    Statements
  }

  def run do
    Faker.start()

    data_checks = Repo.all(DataCheck)

    insert_data("author", data_checks, Author.data(), &Author.insert/1)
    insert_data("challenges", data_checks, Challenges.data(), &Challenges.insert/1)
    insert_data("crimes", data_checks, Crimes.data(), &Crimes.insert/1)

    insert_data("suspects", data_checks, Suspects.data(), &Suspects.insert/1)

    killer = Repo.get(Sqlhelper.Tables.Suspects, Enum.random(1..10))
    IO.inspect(killer, label: "killer")

    insert_data("evidence", data_checks, Evidence.data(killer), &Evidence.insert/1)
    insert_data("witnesses", data_checks, Witnesses.data(), &Witnesses.insert/1)
    insert_data("statements", data_checks, Statements.data(killer), &Statements.insert/1)
  end

  defp insert_data(name, data_checks, static_data, insert_fn) do
    data_check = Enum.find(data_checks, &(&1.name == name))
    # IO.inspect(data_check, label: "data_check")

    if data_check == nil or data_check.inserted == false do
      static_data |> insert_fn.()

      dc =
        case Repo.get_by(DataCheck, name: name) do
          nil -> %DataCheck{name: name, inserted: true}
          dc -> dc
        end

      DataCheck.changeset(dc, %{inserted: true})
      |> Repo.insert_or_update!()
    end
  end
end
