defmodule DistrictFinder.CORS do
  use Corsica.Router,
    max_age: 600,
    allow_credentials: true,
    allow_headers: ["user-agent", "accept", "content-type", "authorization"],
    origins: "*"
end
