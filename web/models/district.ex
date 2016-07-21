defmodule DistrictFinder.District do
  use DistrictFinder.Web, :model

  schema "districts" do
    field :name, :string
    field :geometry, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :geometry])
    |> validate_required([:name, :geometry])
  end
end
