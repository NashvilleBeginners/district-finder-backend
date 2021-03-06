defmodule DistrictFinder.Router do
  use DistrictFinder.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json", "json-api"]
    plug JaSerializer.ContentTypeNegotiation
    plug JaSerializer.Deserializer
    plug DistrictFinder.CORS
  end

  scope "/", DistrictFinder do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", DistrictFinder do
    pipe_through :api

    resources "/districts", DistrictController, only: [:index]
    resources "/neighborhoods", NeighborhoodController, only: [:index]
  end
end
