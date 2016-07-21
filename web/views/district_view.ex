defmodule DistrictFinder.DistrictView do
  use DistrictFinder.Web, :view

  attributes [
    :gid,
    :address,
    :district,
    :last_name,
    :zip,
    :city,
    :email,
    :position,
    :first_name,
    :res_phone,
    :bus_phone
  ]
end
