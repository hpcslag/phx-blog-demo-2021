defmodule Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "comments" do
    field :content, :string
    field :name, :string
    belongs_to :post, Blog.Posts, foreign_key: :post_id

    timestamps()
  end

  # must \\ %{} for changeset/1 invoking
  # must add reference :post_id to cast
  @doc false
  def changeset(comment, attrs \\ %{}) do
    comment
    |> cast(attrs, [:name, :content, :post_id])
    |> validate_required([:name, :content, :post_id])
  end
end
