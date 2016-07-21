defmodule DistrictFinder.DistrictTest do
  use DistrictFinder.ModelCase

  alias DistrictFinder.District

  @valid_attrs %{geometry: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = District.changeset(%District{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = District.changeset(%District{}, @invalid_attrs)
    refute changeset.valid?
  end
end
