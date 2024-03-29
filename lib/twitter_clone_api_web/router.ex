defmodule TwitterCloneApiWeb.Router do
  use TwitterCloneApiWeb, :router

  pipeline :api do
    plug CORSPlug, origin: ["http://localhost:3000", "http://site.samulettitan.com"]
    plug :accepts, ["json"]
  end

  scope "/api", TwitterCloneApiWeb do
    pipe_through :api
    
    get "/tweets/ordered", TweetController, :listbyretweets
    resources "/tweets", TweetController, except: [:new, :edit]
    put "/retweet/:id", TweetController, :retweet
    
    options "/retweet/:id", TweetController, :options
    options "/tweets", TweetController, :options
  end
end
