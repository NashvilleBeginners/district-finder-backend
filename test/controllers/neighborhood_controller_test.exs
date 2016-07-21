defmodule DistrictFinder.NeighborhoodControllerTest do
  use DistrictFinder.ConnCase

  alias DistrictFinder.Neighborhood
  @valid_attrs %{}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, neighborhood_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    neighborhood = Repo.insert! %Neighborhood{}
    conn = get conn, neighborhood_path(conn, :show, neighborhood)
    assert json_response(conn, 200)["data"] == %{"id" => neighborhood.id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, neighborhood_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, neighborhood_path(conn, :create), neighborhood: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Neighborhood, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, neighborhood_path(conn, :create), neighborhood: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    neighborhood = Repo.insert! %Neighborhood{}
    conn = put conn, neighborhood_path(conn, :update, neighborhood), neighborhood: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Neighborhood, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    neighborhood = Repo.insert! %Neighborhood{}
    conn = put conn, neighborhood_path(conn, :update, neighborhood), neighborhood: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    neighborhood = Repo.insert! %Neighborhood{}
    conn = delete conn, neighborhood_path(conn, :delete, neighborhood)
    assert response(conn, 204)
    refute Repo.get(Neighborhood, neighborhood.id)
  end
end
