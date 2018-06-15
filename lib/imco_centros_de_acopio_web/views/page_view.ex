defmodule ImcoCentrosDeAcopioWeb.PageView do
  use ImcoCentrosDeAcopioWeb, :view

  def key do
    "key=#{Application.get_env(:imco_centros_de_acopio, :google_maps_api_key)}"
  end
end
