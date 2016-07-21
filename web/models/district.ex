defmodule DistrictFinder.District do
  use DistrictFinder.Web, :model
  import Geo.PostGIS

  @primary_key {:gid, :id, autogenerate: true}

  schema "districts" do
    field :address, :string
    field :district, :integer
    field :last_name, :string
    field :zip, :integer
    field :city, :string
    field :email, :string
    field :position, :string
    field :first_name, :string
    field :res_phone, :string
    field :bus_phone, :string
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

  def get_district(lng, lat) do
    point = %Geo.Point{coordinates: {lng, lat}, srid: 4326}
    from d in DistrictFinder.District,
    where: st_contains(d.geom, ^point),
    select: d
  end
end
