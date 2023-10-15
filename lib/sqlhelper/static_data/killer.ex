defmodule Sqlhelper.StaticData.Killer do
  alias Sqlhelper.Tables.Killer
  alias Sqlhelper.Repo

  def data(suspect) do
    suspect
  end

  def insert(killer) do
    Repo.insert!(%Killer{} |> Killer.changeset(killer))
  end
end
