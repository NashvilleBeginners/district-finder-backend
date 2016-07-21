defmodule DistrictFinder.Neighborhood do
  use DistrictFinder.Web, :model
  import Geo.PostGIS

  @primary_key {:gid, :id, autogenerate: true}

  schema "neighborhoods" do
    field :name, :string
    field :id, :integer
    field :group_type, :string
    field :geom, Geo.Geometry
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end

  def get_neighborhood(lng, lat) do
    point = %Geo.Point{coordinates: {lng, lat}, srid: 4326}
    from n in DistrictFinder.Neighborhood,
    where: st_contains(n.geom, ^point),
    select: n
  end
end
