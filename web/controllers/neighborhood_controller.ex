defmodule DistrictFinder.NeighborhoodController do
  use DistrictFinder.Web, :controller

  alias DistrictFinder.Neighborhood

  def index(conn, params) do
    neighborhoods = Neighborhood.get_neighborhood(params["lng"], params["lat"])
    |> Repo.all
    render(conn,  data: neighborhoods)
  end
end
