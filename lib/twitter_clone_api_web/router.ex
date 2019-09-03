defmodule TwitterCloneApiWeb.Router do
  use TwitterCloneApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", TwitterCloneApiWeb do
    pipe_through :api
    
    get "/tweets/ordered", TweetController, :listbyretweets
    resources "/tweets", TweetController, except: [:new, :edit]
    put "/retweet/:id", TweetController, :retweet
  end
end
