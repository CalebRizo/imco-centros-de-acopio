defmodule ImcoCentrosDeAcopioWeb.RefugeView do
  use ImcoCentrosDeAcopioWeb, :view
  alias ImcoCentrosDeAcopioWeb.RefugeView

  def render("index.json", %{refuges: refuges}) do
    %{data: render_many(refuges, RefugeView, "refuge.json")}
  end

  def render("show.json", %{refuge: refuge}) do
    %{data: render_one(refuge, RefugeView, "refuge.json")}
  end

  def render("refuge.json", %{refuge: refuge}) do
    %{id: refuge.id,
      state: refuge.state,
      municipality: refuge.municipality,
      suburb: refuge.suburb,
      name: refuge.name,
      necessities: refuge.necessities,
      telephone: refuge.telephone,
      email: refuge.email,
      twitter: refuge.twitter,
      facebook: refuge.facebook,
      capacity: refuge.capacity,
      disponibility: refuge.disponibility,
      between_streets: refuge.between_streets,
      address: refuge.address,
      google_maps_link: refuge.google_maps_link,
      latitude: refuge.latitude,
      longitude: refuge.longitude,
      schedules: refuge.schedules,
      imco_id: refuge.imco_id}
  end
end
