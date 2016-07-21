defmodule DistrictFinder.DistrictController do
  use DistrictFinder.Web, :controller

  alias DistrictFinder.District

  def index(conn, params) do
    districts = District.get_district(params["lng"], params["lat"])
    |> Repo.all
    render(conn, data: districts)
  end
end
