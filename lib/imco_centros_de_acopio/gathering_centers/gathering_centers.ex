defmodule ImcoCentrosDeAcopio.GatheringCenters do
  @moduledoc """
  The GatheringCenters context.
  """

  import Ecto.Query, warn: false
  alias ImcoCentrosDeAcopio.Repo

  alias ImcoCentrosDeAcopio.GoogleMaps

  def getClosestCenter(%{"id" => refugeId, "coords" => coords}) do
    IO.puts "Refuge ID: #{refugeId}"
    refuge = get_refuge!(refugeId)

    list_centers()
    |> Enum.filter(&(&1.municipality == refuge.municipality))
    |> Enum.map(&(getDistance(&1,coords)))
    |> Enum.sort(&(&1.distance < &2.distance))
    |> List.first
  end

  def getDistance(%{latitude: latitude, longitude: longitude} \\ %{latitude: 19.4114771, longitude: -99.1625712},
                  originCoords) do
    {:ok, %{"lat" => lat, "lng" => lng}} = Poison.decode(originCoords)

    "?units=metric"
    |> addString("&origins=#{lat},#{lng}")
    |> addString("&destinations=#{latitude},#{longitude}")
    |> addString("&key=#{Application.get_env(:imco_centros_de_acopio, :google_maps_api_key)}")
    |> GoogleMaps.distancematrix
    |> mapToDistanceAndDestination
  end

  def mapToDistanceAndDestination({:ok, response}) do
    body = response.body

    destination = body["destination_addresses"]
    |> List.first

    distance = body["rows"]
    |> List.first
    |> Map.get("elements")
    |> List.first
    |> Map.get("distance")
    |> Map.get("value")

    %{destination: destination, distance: distance}
  end

  def addString(this, plusthis) do
    this <> plusthis
  end

  alias ImcoCentrosDeAcopio.GatheringCenters.Center

  @doc """
  Returns the list of centers.

  ## Examples

      iex> list_centers()
      [%Center{}, ...]

  """
  def list_centers do
    Repo.all(Center)
  end

  @doc """
  Gets a single center.

  Raises `Ecto.NoResultsError` if the Center does not exist.

  ## Examples

      iex> get_center!(123)
      %Center{}

      iex> get_center!(456)
      ** (Ecto.NoResultsError)

  """
  def get_center!(id), do: Repo.get!(Center, id)

  @doc """
  Creates a center.

  ## Examples

      iex> create_center(%{field: value})
      {:ok, %Center{}}

      iex> create_center(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_center(attrs \\ %{}) do
    %Center{}
    |> Center.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a center.

  ## Examples

      iex> update_center(center, %{field: new_value})
      {:ok, %Center{}}

      iex> update_center(center, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_center(%Center{} = center, attrs) do
    center
    |> Center.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Center.

  ## Examples

      iex> delete_center(center)
      {:ok, %Center{}}

      iex> delete_center(center)
      {:error, %Ecto.Changeset{}}

  """
  def delete_center(%Center{} = center) do
    Repo.delete(center)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking center changes.

  ## Examples

      iex> change_center(center)
      %Ecto.Changeset{source: %Center{}}

  """
  def change_center(%Center{} = center) do
    Center.changeset(center, %{})
  end

  alias ImcoCentrosDeAcopio.GatheringCenters.Refuge

  @doc """
  Returns the list of refuges.

  ## Examples

      iex> list_refuges()
      [%Refuge{}, ...]

  """
  def list_refuges do
    Repo.all(Refuge)
  end

  @doc """
  Gets a single refuge.

  Raises `Ecto.NoResultsError` if the Refuge does not exist.

  ## Examples

      iex> get_refuge!(123)
      %Refuge{}

      iex> get_refuge!(456)
      ** (Ecto.NoResultsError)

  """
  def get_refuge!(id), do: Repo.get!(Refuge, id)

  @doc """
  Creates a refuge.

  ## Examples

      iex> create_refuge(%{field: value})
      {:ok, %Refuge{}}

      iex> create_refuge(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_refuge(attrs \\ %{}) do
    %Refuge{}
    |> Refuge.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a refuge.

  ## Examples

      iex> update_refuge(refuge, %{field: new_value})
      {:ok, %Refuge{}}

      iex> update_refuge(refuge, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_refuge(%Refuge{} = refuge, attrs) do
    refuge
    |> Refuge.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Refuge.

  ## Examples

      iex> delete_refuge(refuge)
      {:ok, %Refuge{}}

      iex> delete_refuge(refuge)
      {:error, %Ecto.Changeset{}}

  """
  def delete_refuge(%Refuge{} = refuge) do
    Repo.delete(refuge)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking refuge changes.

  ## Examples

      iex> change_refuge(refuge)
      %Ecto.Changeset{source: %Refuge{}}

  """
  def change_refuge(%Refuge{} = refuge) do
    Refuge.changeset(refuge, %{})
  end
end
