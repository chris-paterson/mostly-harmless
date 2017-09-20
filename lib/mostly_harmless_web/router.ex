defmodule MostlyHarmlessWeb.Router do
  use MostlyHarmlessWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MostlyHarmlessWeb.Plugs.LoadCustomer
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MostlyHarmlessWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/categories/:name", CategoryController, :show
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete # GET so it does not make a form.
  end

  # Other scopes may use custom stacks.
  # scope "/api", MostlyHarmlessWeb do
  #   pipe_through :api
  # end
end
