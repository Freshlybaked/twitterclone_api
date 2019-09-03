defmodule TwitterCloneApiWeb.TweetView do
  use TwitterCloneApiWeb, :view
  alias TwitterCloneApiWeb.TweetView

  def render("index.json", %{tweets: tweets}) do
    %{data: render_many(tweets, TweetView, "tweet.json")}
  end

  def render("show.json", %{tweet: tweet}) do
    %{data: render_one(tweet, TweetView, "tweet.json")}
  end

  def render("tweet.json", %{tweet: tweet}) do
    %{id: tweet.id,
      content: tweet.content,
      retweets: tweet.retweets}
  end
end
