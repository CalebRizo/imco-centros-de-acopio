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
alias ImcoCentrosDeAcopio.Repo

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
    _,
    _,
    latitude,
    longitude,
    schedules,
    description,
    link,
    status,
    verified_by,
    _,
    _,
    _,
    _,
    imco_id,
  ]) do

    is_active = case status do
      1 -> true
      _ -> false
    end

    necessities_list = necessities
    |> String.split(",")

    %Center{
      name: "#{name}",
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
      necessities: necessities_list,
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

Repo.delete_all(Center)

Path.expand("./priv/repo/utils/CentrosdeAcopio.xlsx")
|> stream_list(0)
|> Stream.drop(1)
|> Enum.map(&Seeds.mapRowToCenter(&1))
#|> Enum.take(1)
#|> IO.inspect
|> Enum.each(&Repo.insert!(&1))
