defmodule TwitterCloneApi.Repo.Migrations.CreateTweets do
  use Ecto.Migration

  def change do
    create table(:tweets) do
      add :content, :string, size: 140
      add :retweets, :integer

      timestamps()
    end

  end
end
