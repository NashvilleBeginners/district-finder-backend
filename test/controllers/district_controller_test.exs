defmodule DistrictFinder.DistrictControllerTest do
  use DistrictFinder.ConnCase

  alias DistrictFinder.District
  @valid_attrs %{geometry: "some content", name: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, district_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    district = Repo.insert! %District{}
    conn = get conn, district_path(conn, :show, district)
    assert json_response(conn, 200)["data"] == %{"id" => district.id,
      "name" => district.name,
      "geometry" => district.geometry}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, district_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, district_path(conn, :create), district: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(District, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, district_path(conn, :create), district: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    district = Repo.insert! %District{}
    conn = put conn, district_path(conn, :update, district), district: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(District, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    district = Repo.insert! %District{}
    conn = put conn, district_path(conn, :update, district), district: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    district = Repo.insert! %District{}
    conn = delete conn, district_path(conn, :delete, district)
    assert response(conn, 204)
    refute Repo.get(District, district.id)
  end
end
