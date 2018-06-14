defmodule ImcoCentrosDeAcopioWeb.RefugeControllerTest do
  use ImcoCentrosDeAcopioWeb.ConnCase

  alias ImcoCentrosDeAcopio.GatheringCenters
  alias ImcoCentrosDeAcopio.GatheringCenters.Refuge

  @create_attrs %{address: "some address", between_streets: "some between_streets", capacity: "some capacity", disponibility: "some disponibility", email: "some email", facebook: "some facebook", google_maps_link: "some google_maps_link", imco_id: "some imco_id", latitude: 120.5, longitude: 120.5, municipality: "some municipality", name: "some name", necessities: "some necessities", schedules: "some schedules", state: "some state", suburb: "some suburb", telephone: "some telephone", twitter: "some twitter"}
  @update_attrs %{address: "some updated address", between_streets: "some updated between_streets", capacity: "some updated capacity", disponibility: "some updated disponibility", email: "some updated email", facebook: "some updated facebook", google_maps_link: "some updated google_maps_link", imco_id: "some updated imco_id", latitude: 456.7, longitude: 456.7, municipality: "some updated municipality", name: "some updated name", necessities: "some updated necessities", schedules: "some updated schedules", state: "some updated state", suburb: "some updated suburb", telephone: "some updated telephone", twitter: "some updated twitter"}
  @invalid_attrs %{address: nil, between_streets: nil, capacity: nil, disponibility: nil, email: nil, facebook: nil, google_maps_link: nil, imco_id: nil, latitude: nil, longitude: nil, municipality: nil, name: nil, necessities: nil, schedules: nil, state: nil, suburb: nil, telephone: nil, twitter: nil}

  def fixture(:refuge) do
    {:ok, refuge} = GatheringCenters.create_refuge(@create_attrs)
    refuge
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all refuges", %{conn: conn} do
      conn = get conn, refuge_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create refuge" do
    test "renders refuge when data is valid", %{conn: conn} do
      conn = post conn, refuge_path(conn, :create), refuge: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, refuge_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some address",
        "between_streets" => "some between_streets",
        "capacity" => "some capacity",
        "disponibility" => "some disponibility",
        "email" => "some email",
        "facebook" => "some facebook",
        "google_maps_link" => "some google_maps_link",
        "imco_id" => "some imco_id",
        "latitude" => 120.5,
        "longitude" => 120.5,
        "municipality" => "some municipality",
        "name" => "some name",
        "necessities" => "some necessities",
        "schedules" => "some schedules",
        "state" => "some state",
        "suburb" => "some suburb",
        "telephone" => "some telephone",
        "twitter" => "some twitter"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, refuge_path(conn, :create), refuge: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update refuge" do
    setup [:create_refuge]

    test "renders refuge when data is valid", %{conn: conn, refuge: %Refuge{id: id} = refuge} do
      conn = put conn, refuge_path(conn, :update, refuge), refuge: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, refuge_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some updated address",
        "between_streets" => "some updated between_streets",
        "capacity" => "some updated capacity",
        "disponibility" => "some updated disponibility",
        "email" => "some updated email",
        "facebook" => "some updated facebook",
        "google_maps_link" => "some updated google_maps_link",
        "imco_id" => "some updated imco_id",
        "latitude" => 456.7,
        "longitude" => 456.7,
        "municipality" => "some updated municipality",
        "name" => "some updated name",
        "necessities" => "some updated necessities",
        "schedules" => "some updated schedules",
        "state" => "some updated state",
        "suburb" => "some updated suburb",
        "telephone" => "some updated telephone",
        "twitter" => "some updated twitter"}
    end

    test "renders errors when data is invalid", %{conn: conn, refuge: refuge} do
      conn = put conn, refuge_path(conn, :update, refuge), refuge: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete refuge" do
    setup [:create_refuge]

    test "deletes chosen refuge", %{conn: conn, refuge: refuge} do
      conn = delete conn, refuge_path(conn, :delete, refuge)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, refuge_path(conn, :show, refuge)
      end
    end
  end

  defp create_refuge(_) do
    refuge = fixture(:refuge)
    {:ok, refuge: refuge}
  end
end
