defmodule ImcoCentrosDeAcopioWeb.PageController do
  use ImcoCentrosDeAcopioWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def mapa(conn, _params) do
    render conn, "mapa.html"
  end
end
