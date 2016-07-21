defmodule DistrictFinder.DistrictController do
  use DistrictFinder.Web, :controller

  alias DistrictFinder.District

  def index(conn, _params) do
    districts = Repo.all(District)
    render(conn, "index.json", districts: districts)
  end

  def create(conn, %{"district" => district_params}) do
    changeset = District.changeset(%District{}, district_params)

    case Repo.insert(changeset) do
      {:ok, district} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", district_path(conn, :show, district))
        |> render("show.json", district: district)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DistrictFinder.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    district = Repo.get!(District, id)
    render(conn, "show.json", district: district)
  end

  def update(conn, %{"id" => id, "district" => district_params}) do
    district = Repo.get!(District, id)
    changeset = District.changeset(district, district_params)

    case Repo.update(changeset) do
      {:ok, district} ->
        render(conn, "show.json", district: district)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(DistrictFinder.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    district = Repo.get!(District, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(district)

    send_resp(conn, :no_content, "")
  end
end
