defmodule EasyBlog.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset

  alias EasyBlog.Accounts.User
  alias EasyBlog.Blog.Post

  schema "comments" do
    field :content, :string

    belongs_to(:user, User)
    belongs_to(:post, Post)

    timestamps()
  end

  @doc false
  def changeset(comment, attrs) do
    comment
    |> cast(attrs, [:content, :user_id, :post_id])
    |> validate_required([:content, :user_id, :post_id])
  end
end
