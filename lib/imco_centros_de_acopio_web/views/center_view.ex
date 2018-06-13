defmodule ImcoCentrosDeAcopioWeb.CenterView do
  use ImcoCentrosDeAcopioWeb, :view
  alias ImcoCentrosDeAcopioWeb.CenterView

  def render("index.json", %{centers: centers}) do
    %{data: render_many(centers, CenterView, "center.json")}
  end

  def render("show.json", %{center: center}) do
    %{data: render_one(center, CenterView, "center.json")}
  end

  def render("center.json", %{center: center}) do
    %{id: center.id,
      name: center.name,
      type: center.type,
      necessities: center.necessities,
      contact_name: center.contact_name,
      telephone: center.telephone,
      twitter: center.twitter,
      facebook: center.facebook,
      email: center.email,
      address: center.address,
      suburb: center.suburb,
      municipality: center.municipality,
      city: center.city,
      state: center.state,
      latitude: center.latitude,
      longitude: center.longitude,
      schedules: center.schedules,
      description: center.description,
      google_maps_link: center.google_maps_link,
      is_active: center.is_active,
      verified_by: center.verified_by,
      imco_id: center.imco_id}
  end
end
