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

    resources "/centers", CenterController, except: [:new, :edit]
    resources "/refuges", RefugeController, except: [:new, :edit]
  end

  scope "/", ImcoCentrosDeAcopioWeb do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ImcoCentrosDeAcopioWeb do
  #   pipe_through :api
  # end
end
