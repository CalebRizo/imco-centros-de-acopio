defmodule ImcoCentrosDeAcopio.Repo.Migrations.CreateCenters do
  use Ecto.Migration

  def change do
    create table(:centers) do
      add :name, :string
      add :type, :string
      add :necessities, {:array, :string}
      add :contact_name, :string
      add :telephone, :string
      add :twitter, :string
      add :faceboook, :string
      add :email, :string
      add :address, :string
      add :suburb, :string
      add :municipality, :string
      add :city, :string
      add :latitude, :float
      add :longitude, :float
      add :schedules, :string
      add :description, :text
      add :google_maps_link, :string
      add :is_active, :boolean, default: false, null: false
      add :verified_by, :string
      add :imco_id, :string

      timestamps()
    end

  end
end
