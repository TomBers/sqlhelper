defmodule Sqlhelper.Tables.EvidenceMedia do
  use Ecto.Schema
  import Ecto.Changeset

  schema "evidence_media" do
    field :image_path, :string
    belongs_to :evidence, Sqlhelper.Tables.Evidence

    timestamps()
  end

  def changeset(evidence_media, attrs) do
    evidence_media
    |> cast(attrs, [:image_path, :evidence_id])
    |> validate_required([:image_path, :evidence_id])
  end
end
