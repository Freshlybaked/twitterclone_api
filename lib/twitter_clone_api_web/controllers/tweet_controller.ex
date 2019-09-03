defmodule TwitterCloneApiWeb.TweetController do
  use TwitterCloneApiWeb, :controller

  alias TwitterCloneApi.Twitter
  alias TwitterCloneApi.Twitter.Tweet

  action_fallback TwitterCloneApiWeb.FallbackController

  def index(conn, _params) do
    tweets = Twitter.list_tweets()
    render(conn, "index.json", tweets: tweets)
  end

  def create(conn, %{"tweet" => tweet_params}) do
    with {:ok, %Tweet{} = tweet} <- Twitter.create_tweet(tweet_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tweet_path(conn, :show, tweet))
      |> render("show.json", tweet: tweet)
    end
  end

  def show(conn, %{"id" => id}) do
    tweet = Twitter.get_tweet!(id)
    render(conn, "show.json", tweet: tweet)
  end

  def update(conn, %{"id" => id, "tweet" => tweet_params}) do
    tweet = Twitter.get_tweet!(id)

    with {:ok, %Tweet{} = tweet} <- Twitter.update_tweet(tweet, tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end

  def delete(conn, %{"id" => id}) do
    tweet = Twitter.get_tweet!(id)

    with {:ok, %Tweet{}} <- Twitter.delete_tweet(tweet) do
      send_resp(conn, :no_content, "")
    end
  end
  
  def retweet(conn, %{"id" => id}) do
    tweet = Twitter.get_tweet!(id)
    updated_tweet_params = %{"retweets": tweet.retweets + 1}
    with {:ok, %Tweet{} = tweet} <- Twitter.update_tweet(tweet, updated_tweet_params) do
      render(conn, "show.json", tweet: tweet)
    end
  end
end
