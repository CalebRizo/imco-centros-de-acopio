defmodule ImcoCentrosDeAcopio.GoogleMaps do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://maps.googleapis.com/maps/api"
  plug Tesla.Middleware.JSON

  def directions(params) do
    get("/directions/json#{params}")
  end

  def distancematrix(params) do
    get("/distancematrix/json#{params}")
  end
end
