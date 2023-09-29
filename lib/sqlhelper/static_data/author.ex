defmodule Sqlhelper.StaticData.Author do
  alias Sqlhelper.Authors.Author
  alias Sqlhelper.Repo

  def data do
    [
      %{name: "Test Author"}
    ]
  end

  def insert(author_data) do
    author_data
    |> Enum.map(&Repo.insert!(%Author{} |> Author.changeset(&1)))
  end
end
