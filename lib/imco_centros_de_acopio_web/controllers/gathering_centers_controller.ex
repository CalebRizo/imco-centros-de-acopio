defmodule ImcoCentrosDeAcopioWeb.GatheringCentersController do
  use ImcoCentrosDeAcopioWeb, :controller

  alias ImcoCentrosDeAcopio.GatheringCenters

  action_fallback ImcoCentrosDeAcopioWeb.FallbackController

  def closest(conn, origin) do
    closest = GatheringCenters.getClosestCenter(origin)
    render(conn, "show.json", closest: closest)
  end
end
