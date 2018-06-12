defmodule ImcoCentrosDeAcopioWeb.CenterController do
  use ImcoCentrosDeAcopioWeb, :controller

  alias ImcoCentrosDeAcopio.GatheringCenters
  alias ImcoCentrosDeAcopio.GatheringCenters.Center

  action_fallback ImcoCentrosDeAcopioWeb.FallbackController

  def index(conn, _params) do
    centers = GatheringCenters.list_centers()
    render(conn, "index.json", centers: centers)
  end

  def create(conn, %{"center" => center_params}) do
    with {:ok, %Center{} = center} <- GatheringCenters.create_center(center_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", center_path(conn, :show, center))
      |> render("show.json", center: center)
    end
  end

  def show(conn, %{"id" => id}) do
    center = GatheringCenters.get_center!(id)
    render(conn, "show.json", center: center)
  end

  def update(conn, %{"id" => id, "center" => center_params}) do
    center = GatheringCenters.get_center!(id)

    with {:ok, %Center{} = center} <- GatheringCenters.update_center(center, center_params) do
      render(conn, "show.json", center: center)
    end
  end

  def delete(conn, %{"id" => id}) do
    center = GatheringCenters.get_center!(id)
    with {:ok, %Center{}} <- GatheringCenters.delete_center(center) do
      send_resp(conn, :no_content, "")
    end
  end
end
