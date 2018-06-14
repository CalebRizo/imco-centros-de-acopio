defmodule ImcoCentrosDeAcopio.Repo.Migrations.CreateRefuges do
  use Ecto.Migration

  def change do
    create table(:refuges) do
      add :state, :string
      add :municipality, :string
      add :suburb, :string
      add :name, :string
      add :necessities, :text
      add :telephone, :string
      add :email, :string
      add :twitter, :string
      add :facebook, :string
      add :capacity, :string
      add :disponibility, :string
      add :between_streets, :string
      add :address, :string
      add :google_maps_link, :text
      add :latitude, :float
      add :longitude, :float
      add :schedules, :string
      add :imco_id, :string

      timestamps()
    end

  end
end
