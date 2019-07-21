defmodule DispatcherWeb.Router do
  use DispatcherWeb, :router

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

  scope "/", DispatcherWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/send", PageController, :send
  end

  # Other scopes may use custom stacks.
  # scope "/api", DispatcherWeb do
  #   pipe_through :api
  # end
end
