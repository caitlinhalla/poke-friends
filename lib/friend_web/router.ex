defmodule FriendWeb.Router do
  use FriendWeb, :router

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

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: FriendWeb.Schema,
      interface: :simple,
      context: %{pubsub: FriendWeb.Endpoint}
  end

  # scope "/", FriendWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  # scope "/api", FriendWeb do
  #   pipe_through :api
  # end
end
