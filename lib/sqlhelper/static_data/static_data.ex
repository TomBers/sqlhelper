defmodule Sqlhelper.StaticData do
  alias Sqlhelper.Repo

  alias Sqlhelper.DataCheck
  alias Sqlhelper.StaticData.Animals
  alias Sqlhelper.StaticData.Owners
  alias Sqlhelper.StaticData.Challenges
  alias Sqlhelper.StaticData.Suspects

  def run do
    data_checks = Repo.all(DataCheck)

    insert_data("animals", data_checks, Animals.data(), &Animals.insert/1)
    insert_data("owners", data_checks, Owners.data(), &Owners.insert/1)
    insert_data("challenges", data_checks, Challenges.data(), &Challenges.insert/1)

    insert_data("suspects", data_checks, Suspects.data(), &Suspects.insert/1)
  end

  defp insert_data(name, data_checks, static_data, insert_fn) do
    data_check = Enum.find(data_checks, &(&1.name == name))

    if data_check == nil or not data_check.inserted do
      static_data |> insert_fn.()

      dc =
        case Repo.get_by(DataCheck, name: name) do
          nil -> %DataCheck{name: name, inserted: true}
          dc -> %DataCheck{dc | inserted: true}
        end

      DataCheck.changeset(dc, %{name: name, inserted: true})
      |> Repo.insert_or_update!()
    end
  end
end
