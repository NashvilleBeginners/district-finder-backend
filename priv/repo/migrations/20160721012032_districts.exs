defmodule DistrictFinder.Repo.Migrations.Districts do
  use Ecto.Migration

  def up do
    File.read!(Application.app_dir(:district_finder_backend, "priv") <> "/districts.sql")
    |> String.split("-- statement --")
    |> Stream.each(&(execute &1))
    |> Stream.run
  end

  def down do
    drop table(:districts)
  end
end
