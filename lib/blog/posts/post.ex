defmodule Blog.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string

    has_many :comments, Blog.Comment

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body]) # @TEST HERE
    |> validate_required([:title, :body])
  end

  import Ecto.Query
  def count_comments(query) do
    from p in query, group_by: p.id, left_join: c in assoc(p, :comments), select: {p, count(c.id)}
  end
end
