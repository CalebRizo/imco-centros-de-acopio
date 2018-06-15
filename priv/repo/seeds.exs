# mix run priv/repo/seeds.exs

import Xlsxir
alias ImcoCentrosDeAcopio.GatheringCenters.{Center, Refuge}
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
      telephone: "#{telephone}",
      twitter: twitter,
      type: type,
      verified_by: verified_by
    }
  end

  def mapRowToRefuge([
    state,
    municipality,
    suburb,
    name,
    necessities,
    telephone,
    email,
    facebook,
    capacity,
    disponibility,
    between_streets,
    street,
    number,
    google_maps_link,
    latitude,
    longitude,
    schedules,
    _,
    _,
    _,
    _,
    imco_id,
  ]) do
    %Refuge{
      address: "#{street} #{number}",
      between_streets: between_streets,
      capacity: "#{capacity}",
      disponibility: "#{disponibility}",
      email: email,
      facebook: facebook,
      google_maps_link: google_maps_link,
      imco_id: imco_id,
      latitude: latitude,
      longitude: longitude,
      municipality: municipality,
      name: "#{name}",
      necessities: necessities,
      schedules: schedules,
      state: state,
      suburb: suburb,
      telephone: telephone,
    }
  end

  def fromXlsxToDb(filePath, sheet, func) do
    "#{:code.priv_dir(:imco_centros_de_acopio)}/repo/utils#{filePath}"
    |> stream_list(sheet)
    |> Stream.drop(1)
    |> Enum.map(&func.(&1))
    |> Enum.each(&Repo.insert!(&1))
  end
end

Repo.delete_all(Center)
Seeds.fromXlsxToDb("/CentrosdeAcopio.xlsx", 0, &Seeds.mapRowToCenter/1)

Repo.delete_all(Refuge)
Seeds.fromXlsxToDb("/CentrosdeAcopio.xlsx", 1, &Seeds.mapRowToRefuge/1)
