defmodule ImcoCentrosDeAcopio.GatheringCenters.Refuge do
  use Ecto.Schema
  import Ecto.Changeset


  schema "refuges" do
    field :address, :string
    field :between_streets, :string
    field :capacity, :string
    field :disponibility, :string
    field :email, :string
    field :facebook, :string
    field :google_maps_link, :string
    field :imco_id, :string
    field :latitude, :float
    field :longitude, :float
    field :municipality, :string
    field :name, :string
    field :necessities, :string
    field :schedules, :string
    field :state, :string
    field :suburb, :string
    field :telephone, :string
    field :twitter, :string

    timestamps()
  end

  @doc false
  def changeset(refuge, attrs) do
    refuge
    |> cast(attrs, [:state, :municipality, :suburb, :name, :necessities, :telephone, :email, :twitter, :facebook, :capacity, :disponibility, :between_streets, :address, :google_maps_link, :latitude, :longitude, :schedules, :imco_id])
    |> validate_required([:state, :municipality, :suburb, :name, :necessities, :telephone, :email, :twitter, :facebook, :capacity, :disponibility, :between_streets, :address, :google_maps_link, :latitude, :longitude, :schedules, :imco_id])
  end
end
