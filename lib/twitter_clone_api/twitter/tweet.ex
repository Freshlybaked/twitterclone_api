defmodule TwitterCloneApi.Twitter.Tweet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tweets" do
    field :content, :string
    field :retweets, :integer

    timestamps()
  end

  @doc false
  def changeset(tweet, attrs) do
    tweet
    |> cast(attrs, [:content, :retweets])
    |> validate_required([:content, :retweets])
  end
end
