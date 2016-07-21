defmodule DistrictFinder.DistrictView do
  use DistrictFinder.Web, :view

  def render("index.json", %{districts: districts}) do
    %{data: render_many(districts, DistrictFinder.DistrictView, "district.json")}
  end

  def render("show.json", %{district: district}) do
    %{data: render_one(district, DistrictFinder.DistrictView, "district.json")}
  end

  def render("district.json", %{district: district}) do
    %{id: district.id}
  end
end
