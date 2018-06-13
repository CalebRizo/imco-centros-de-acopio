defmodule ImcoCentrosDeAcopioWeb.CenterControllerTest do
  use ImcoCentrosDeAcopioWeb.ConnCase

  alias ImcoCentrosDeAcopio.GatheringCenters
  alias ImcoCentrosDeAcopio.GatheringCenters.Center

  @create_attrs %{address: "some address", city: "some city", contact_name: "some contact_name", description: "some description", email: "some email", facebook: "some facebook", google_maps_link: "some google_maps_link", imco_id: "some imco_id", is_active: true, latitude: 120.5, longitude: 120.5, municipality: "some municipality", name: "some name", necessities: [], schedules: "some schedules", state: "some state", suburb: "some suburb", telephone: "some telephone", twitter: "some twitter", type: "some type", verified_by: "some verified_by"}
  @update_attrs %{address: "some updated address", city: "some updated city", contact_name: "some updated contact_name", description: "some updated description", email: "some updated email", facebook: "some updated facebook", google_maps_link: "some updated google_maps_link", imco_id: "some updated imco_id", is_active: false, latitude: 456.7, longitude: 456.7, municipality: "some updated municipality", name: "some updated name", necessities: [], schedules: "some updated schedules", state: "some updated state", suburb: "some updated suburb", telephone: "some updated telephone", twitter: "some updated twitter", type: "some updated type", verified_by: "some updated verified_by"}
  @invalid_attrs %{address: nil, city: nil, contact_name: nil, description: nil, email: nil, facebook: nil, google_maps_link: nil, imco_id: nil, is_active: nil, latitude: nil, longitude: nil, municipality: nil, name: nil, necessities: nil, schedules: nil, state: nil, suburb: nil, telephone: nil, twitter: nil, type: nil, verified_by: nil}

  def fixture(:center) do
    {:ok, center} = GatheringCenters.create_center(@create_attrs)
    center
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all centers", %{conn: conn} do
      conn = get conn, center_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create center" do
    test "renders center when data is valid", %{conn: conn} do
      conn = post conn, center_path(conn, :create), center: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, center_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some address",
        "city" => "some city",
        "contact_name" => "some contact_name",
        "description" => "some description",
        "email" => "some email",
        "facebook" => "some facebook",
        "google_maps_link" => "some google_maps_link",
        "imco_id" => "some imco_id",
        "is_active" => true,
        "latitude" => 120.5,
        "longitude" => 120.5,
        "municipality" => "some municipality",
        "name" => "some name",
        "necessities" => [],
        "schedules" => "some schedules",
        "state" => "some state",
        "suburb" => "some suburb",
        "telephone" => "some telephone",
        "twitter" => "some twitter",
        "type" => "some type",
        "verified_by" => "some verified_by"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, center_path(conn, :create), center: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update center" do
    setup [:create_center]

    test "renders center when data is valid", %{conn: conn, center: %Center{id: id} = center} do
      conn = put conn, center_path(conn, :update, center), center: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, center_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "address" => "some updated address",
        "city" => "some updated city",
        "contact_name" => "some updated contact_name",
        "description" => "some updated description",
        "email" => "some updated email",
        "facebook" => "some updated facebook",
        "google_maps_link" => "some updated google_maps_link",
        "imco_id" => "some updated imco_id",
        "is_active" => false,
        "latitude" => 456.7,
        "longitude" => 456.7,
        "municipality" => "some updated municipality",
        "name" => "some updated name",
        "necessities" => [],
        "schedules" => "some updated schedules",
        "state" => "some updated state",
        "suburb" => "some updated suburb",
        "telephone" => "some updated telephone",
        "twitter" => "some updated twitter",
        "type" => "some updated type",
        "verified_by" => "some updated verified_by"}
    end

    test "renders errors when data is invalid", %{conn: conn, center: center} do
      conn = put conn, center_path(conn, :update, center), center: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete center" do
    setup [:create_center]

    test "deletes chosen center", %{conn: conn, center: center} do
      conn = delete conn, center_path(conn, :delete, center)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, center_path(conn, :show, center)
      end
    end
  end

  defp create_center(_) do
    center = fixture(:center)
    {:ok, center: center}
  end
end
