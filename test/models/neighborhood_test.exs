defmodule DistrictFinder.NeighborhoodTest do
  use DistrictFinder.ModelCase

  alias DistrictFinder.Neighborhood

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Neighborhood.changeset(%Neighborhood{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Neighborhood.changeset(%Neighborhood{}, @invalid_attrs)
    refute changeset.valid?
  end
end
