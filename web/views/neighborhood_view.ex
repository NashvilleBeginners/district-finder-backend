defmodule DistrictFinder.NeighborhoodView do
  use DistrictFinder.Web, :view

  def render("index.json", %{neighborhoods: neighborhoods}) do
    %{data: render_many(neighborhoods, DistrictFinder.NeighborhoodView, "neighborhood.json")}
  end

  def render("show.json", %{neighborhood: neighborhood}) do
    %{data: render_one(neighborhood, DistrictFinder.NeighborhoodView, "neighborhood.json")}
  end

  def render("neighborhood.json", %{neighborhood: neighborhood}) do
    %{id: neighborhood.id}
  end
end
