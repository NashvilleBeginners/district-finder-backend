defmodule DistrictFinder.DistrictView do
  use DistrictFinder.Web, :view

  attributes [
    :gid,
    :district,
    :councilperson
  ]

  def councilperson(data, _conn) do
    %{
      first_name: data.first_name,
      last_name: data.last_name,
      position: data.position,
      address: data.address,
      city: data.city,
      zip: data.zip,
      email: data.email,
      business_phone: data.bus_phone,
      home_phone: data.res_phone
    }
  end
end
