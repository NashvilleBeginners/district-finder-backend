defmodule DistrictFinder.Neighborhood do
  use DistrictFinder.Web, :model

  schema "neighborhoods" do

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
