defmodule ImcoCentrosDeAcopio.GatheringCentersTest do
  use ImcoCentrosDeAcopio.DataCase

  alias ImcoCentrosDeAcopio.GatheringCenters

  describe "centers" do
    alias ImcoCentrosDeAcopio.GatheringCenters.Center

    @valid_attrs %{address: "some address", city: "some city", contact_name: "some contact_name", description: "some description", email: "some email", faceboook: "some faceboook", google_maps_link: "some google_maps_link", imco_id: "some imco_id", is_active: true, latitude: 120.5, longitude: 120.5, municipality: "some municipality", name: "some name", necessities: [], schedules: "some schedules", suburb: "some suburb", telephone: "some telephone", twitter: "some twitter", type: "some type", verified_by: "some verified_by"}
    @update_attrs %{address: "some updated address", city: "some updated city", contact_name: "some updated contact_name", description: "some updated description", email: "some updated email", faceboook: "some updated faceboook", google_maps_link: "some updated google_maps_link", imco_id: "some updated imco_id", is_active: false, latitude: 456.7, longitude: 456.7, municipality: "some updated municipality", name: "some updated name", necessities: [], schedules: "some updated schedules", suburb: "some updated suburb", telephone: "some updated telephone", twitter: "some updated twitter", type: "some updated type", verified_by: "some updated verified_by"}
    @invalid_attrs %{address: nil, city: nil, contact_name: nil, description: nil, email: nil, faceboook: nil, google_maps_link: nil, imco_id: nil, is_active: nil, latitude: nil, longitude: nil, municipality: nil, name: nil, necessities: nil, schedules: nil, suburb: nil, telephone: nil, twitter: nil, type: nil, verified_by: nil}

    def center_fixture(attrs \\ %{}) do
      {:ok, center} =
        attrs
        |> Enum.into(@valid_attrs)
        |> GatheringCenters.create_center()

      center
    end

    test "list_centers/0 returns all centers" do
      center = center_fixture()
      assert GatheringCenters.list_centers() == [center]
    end

    test "get_center!/1 returns the center with given id" do
      center = center_fixture()
      assert GatheringCenters.get_center!(center.id) == center
    end

    test "create_center/1 with valid data creates a center" do
      assert {:ok, %Center{} = center} = GatheringCenters.create_center(@valid_attrs)
      assert center.address == "some address"
      assert center.city == "some city"
      assert center.contact_name == "some contact_name"
      assert center.description == "some description"
      assert center.email == "some email"
      assert center.faceboook == "some faceboook"
      assert center.google_maps_link == "some google_maps_link"
      assert center.imco_id == "some imco_id"
      assert center.is_active == true
      assert center.latitude == 120.5
      assert center.longitude == 120.5
      assert center.municipality == "some municipality"
      assert center.name == "some name"
      assert center.necessities == []
      assert center.schedules == "some schedules"
      assert center.suburb == "some suburb"
      assert center.telephone == "some telephone"
      assert center.twitter == "some twitter"
      assert center.type == "some type"
      assert center.verified_by == "some verified_by"
    end

    test "create_center/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = GatheringCenters.create_center(@invalid_attrs)
    end

    test "update_center/2 with valid data updates the center" do
      center = center_fixture()
      assert {:ok, center} = GatheringCenters.update_center(center, @update_attrs)
      assert %Center{} = center
      assert center.address == "some updated address"
      assert center.city == "some updated city"
      assert center.contact_name == "some updated contact_name"
      assert center.description == "some updated description"
      assert center.email == "some updated email"
      assert center.faceboook == "some updated faceboook"
      assert center.google_maps_link == "some updated google_maps_link"
      assert center.imco_id == "some updated imco_id"
      assert center.is_active == false
      assert center.latitude == 456.7
      assert center.longitude == 456.7
      assert center.municipality == "some updated municipality"
      assert center.name == "some updated name"
      assert center.necessities == []
      assert center.schedules == "some updated schedules"
      assert center.suburb == "some updated suburb"
      assert center.telephone == "some updated telephone"
      assert center.twitter == "some updated twitter"
      assert center.type == "some updated type"
      assert center.verified_by == "some updated verified_by"
    end

    test "update_center/2 with invalid data returns error changeset" do
      center = center_fixture()
      assert {:error, %Ecto.Changeset{}} = GatheringCenters.update_center(center, @invalid_attrs)
      assert center == GatheringCenters.get_center!(center.id)
    end

    test "delete_center/1 deletes the center" do
      center = center_fixture()
      assert {:ok, %Center{}} = GatheringCenters.delete_center(center)
      assert_raise Ecto.NoResultsError, fn -> GatheringCenters.get_center!(center.id) end
    end

    test "change_center/1 returns a center changeset" do
      center = center_fixture()
      assert %Ecto.Changeset{} = GatheringCenters.change_center(center)
    end
  end
end
