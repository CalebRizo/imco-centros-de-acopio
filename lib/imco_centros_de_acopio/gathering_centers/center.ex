defmodule ImcoCentrosDeAcopio.GatheringCenters.Center do
  use Ecto.Schema
  import Ecto.Changeset


  schema "centers" do
    field :address, :string
    field :city, :string
    field :contact_name, :string
    field :description, :string
    field :email, :string
    field :faceboook, :string
    field :google_maps_link, :string
    field :imco_id, :string
    field :is_active, :boolean, default: false
    field :latitude, :float
    field :longitude, :float
    field :municipality, :string
    field :name, :string
    field :necessities, {:array, :string}
    field :schedules, :string
    field :suburb, :string
    field :telephone, :string
    field :twitter, :string
    field :type, :string
    field :verified_by, :string

    timestamps()
  end

  @doc false
  def changeset(center, attrs) do
    center
    |> cast(attrs, [:name, :type, :necessities, :contact_name, :telephone, :twitter, :faceboook, :email, :address, :suburb, :municipality, :city, :latitude, :longitude, :schedules, :description, :google_maps_link, :is_active, :verified_by, :imco_id])
    |> validate_required([:name, :type, :necessities, :contact_name, :telephone, :twitter, :faceboook, :email, :address, :suburb, :municipality, :city, :latitude, :longitude, :schedules, :description, :google_maps_link, :is_active, :verified_by, :imco_id])
  end
end
