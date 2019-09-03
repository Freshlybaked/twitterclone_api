defmodule TwitterCloneApiWeb.Router do
  use TwitterCloneApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TwitterCloneApiWeb do
    pipe_through :api
    
    resources "/tweets", TweetController, except: [:new, :edit]
  end
end
