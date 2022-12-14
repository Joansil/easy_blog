defmodule EasyBlog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  alias EasyBlog.Accounts.User

  @fields [:title, :content, :published, :user_id]

  schema "posts" do
    field :content, :string
    field :published, :boolean, default: false
    field :title, :string

    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
