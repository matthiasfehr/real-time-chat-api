defmodule RealTimeChatWeb.Router do
  use RealTimeChatWeb, :router

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

  scope "/", RealTimeChatWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  #   Other scopes may use custom stacks.
  scope "/api", RealTimeChatWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
    resources "/chat_rooms", ChatRoomController, except: [:new, :edit]
    resources "/messages", MessageController, except: [:new, :edit]
  end

  forward "/graphql", Absinthe.Plug,
          schema: RealTimeChat.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL,
          schema: RealTimeChat.Schema
end
