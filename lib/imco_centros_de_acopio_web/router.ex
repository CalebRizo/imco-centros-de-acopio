defmodule ImcoCentrosDeAcopioWeb.Router do
  use ImcoCentrosDeAcopioWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ImcoCentrosDeAcopioWeb do
    pipe_through :api

    get "/closest", GatheringCentersController, :closest
    resources "/centers", CenterController, except: [:new, :edit]
    resources "/refuges", RefugeController, except: [:new, :edit]
  end

  scope "/", ImcoCentrosDeAcopioWeb do
    pipe_through :browser # Use the default browser stack

    get "/mapa", PageController, :mapa
    get "/*path", PageController, :index
  end
end
