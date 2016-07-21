defmodule DistrictFinder.NeighborhoodController do
  use DistrictFinder.Web, :controller

  alias DistrictFinder.Neighborhood

  def index(conn, _params) do
    neighborhoods = Repo.all(Neighborhood)
    render(conn, "index.json", neighborhoods: neighborhoods)
  end

  def create(conn, %{"neighborhood" => neighborhood_params}) do
    changeset = Neighborhood.changeset(%Neighborhood{}, neighborhood_params)

    case Repo.insert(changeset) do
      {:ok, neighborhood} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", neighborhood_path(conn, :show, neighborhood))
        |> render("show.json", neighborhood: neighborhood)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DistrictFinder.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    neighborhood = Repo.get!(Neighborhood, id)
    render(conn, "show.json", neighborhood: neighborhood)
  end

  def update(conn, %{"id" => id, "neighborhood" => neighborhood_params}) do
    neighborhood = Repo.get!(Neighborhood, id)
    changeset = Neighborhood.changeset(neighborhood, neighborhood_params)

    case Repo.update(changeset) do
      {:ok, neighborhood} ->
        render(conn, "show.json", neighborhood: neighborhood)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DistrictFinder.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    neighborhood = Repo.get!(Neighborhood, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(neighborhood)

    send_resp(conn, :no_content, "")
  end
end
