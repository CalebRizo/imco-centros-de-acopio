# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ImcoCentrosDeAcopio.Repo.insert!(%ImcoCentrosDeAcopio.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import Xlsxir
alias ImcoCentrosDeAcopio.GatheringCenters.Center

"""
["id", "Nombre del centro de acopio", "Tipo", "Necesidades",
"Nombre Contacto", "Teléfono", "Twitter", "Facebook", "Correo", "calle",
"numero_exterior", "colonia", "delegacion o municipio", "Ciudad", "Entidad",
"Zona", "Dirección (agregada)", "lat", "lon", "Horarios",
"Tipo de Centro de Acopio", "link_google_maps", "Estatus", "Verificado por",
"Fecha de creación", "Última actualización", "Actualizado por",
"Nota actualización", "ID2"]
]
"""

defmodule Seeds do
  def mapRowToCenter([
    _,
    name,
    type,
    necessities,
    contact_name,
    telephone,
    twitter,
    facebook,
    email,
    street,
    number,
    suburb,
    municipality,
    city,
    state,
    zone,
    complete_addres,
    latitude,
    longitude,
    schedules,
    description,
    link,
    is_active,
    verified_by,
    created,
    updated,
    by,
    note,
    imco_id | _
  ]) do
    %Center{
      name: name,
      address: "#{street} #{number}",
      city: city,
      contact_name: contact_name,
      description: description,
      email: email,
      facebook: facebook,
      google_maps_link: link,
      imco_id: imco_id,
      is_active: is_active,
      latitude: latitude,
      longitude: longitude,
      municipality: municipality,
      necessities: necessities,
      schedules: schedules,
      state: state,
      suburb: suburb,
      telephone: telephone,
      twitter: twitter,
      type: type,
      verified_by: verified_by
    }
  end
end

Path.expand("./priv/repo/utils/CentrosdeAcopio.xlsx")
|> stream_list(0)
|> Stream.drop(1)
|> Enum.map(&Seeds.mapRowToCenter(&1))
|> Enum.take(1)
|> IO.inspect


