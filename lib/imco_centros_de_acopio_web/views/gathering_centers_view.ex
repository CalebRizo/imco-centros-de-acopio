defmodule ImcoCentrosDeAcopioWeb.GatheringCentersView do
  use ImcoCentrosDeAcopioWeb, :view
  alias ImcoCentrosDeAcopioWeb.GatheringCentersView

  def render("show.json", %{closest: closest}) do
    %{data: render_one(closest, GatheringCentersView, "info.json")}
  end

  def render("info.json", %{gathering_centers: closest}) do
    %{destination: closest.destination}
  end
end
