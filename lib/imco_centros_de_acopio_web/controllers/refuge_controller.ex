defmodule ImcoCentrosDeAcopioWeb.RefugeController do
  use ImcoCentrosDeAcopioWeb, :controller

  alias ImcoCentrosDeAcopio.GatheringCenters
  alias ImcoCentrosDeAcopio.GatheringCenters.Refuge

  action_fallback ImcoCentrosDeAcopioWeb.FallbackController

  def index(conn, _params) do
    refuges = GatheringCenters.list_refuges()
    render(conn, "index.json", refuges: refuges)
  end

  def create(conn, %{"refuge" => refuge_params}) do
    with {:ok, %Refuge{} = refuge} <- GatheringCenters.create_refuge(refuge_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", refuge_path(conn, :show, refuge))
      |> render("show.json", refuge: refuge)
    end
  end

  def show(conn, %{"id" => id}) do
    refuge = GatheringCenters.get_refuge!(id)
    render(conn, "show.json", refuge: refuge)
  end

  def update(conn, %{"id" => id, "refuge" => refuge_params}) do
    refuge = GatheringCenters.get_refuge!(id)

    with {:ok, %Refuge{} = refuge} <- GatheringCenters.update_refuge(refuge, refuge_params) do
      render(conn, "show.json", refuge: refuge)
    end
  end

  def delete(conn, %{"id" => id}) do
    refuge = GatheringCenters.get_refuge!(id)
    with {:ok, %Refuge{}} <- GatheringCenters.delete_refuge(refuge) do
      send_resp(conn, :no_content, "")
    end
  end
end
