defmodule DistrictFinder.PageController do
  use DistrictFinder.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
