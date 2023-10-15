defmodule Sqlhelper.Tables.Killer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "killers" do
    belongs_to :crimes, Sqlhelper.Tables.Crimes, foreign_key: :crime_id
    field :killer, :string
    timestamps()
  end

  def changeset(killer, attrs) do
    encoded = encode_killer(attrs)

    killer
    |> cast(encoded, [:crime_id, :killer])
    |> validate_required([:crime_id, :killer])
  end

  defp encode_killer(suspect) do
    crime_id = suspect.crime_id

    killer =
      suspect
      |> Map.from_struct()
      |> Map.drop([:__meta__, :crime])
      |> Jason.encode!()
      |> Base.encode64()

    %{crime_id: crime_id, killer: killer}
  end

  def check_answer(guess_id, killer) do
    id = decode_killer(killer) |> Map.get("id")

    if id == String.to_integer(guess_id) do
      IO.inspect("Correct!")
      true
    else
      IO.inspect("Wrong!")
      false
    end
  end

  defp decode_killer(killer) do
    killer |> Base.decode64!() |> Jason.decode!()
  end
end
