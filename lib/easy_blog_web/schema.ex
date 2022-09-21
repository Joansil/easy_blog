defmodule EasyBlogWeb.Schema do
  use Absinthe.Schema

  alias EasyBlogWeb.Resolvers
  alias EasyBlogWeb.Schema.Middleware

  # import types
  import_types(EasyBlogWeb.Schema.Types)

  query do
    @desc "get a list of all users"
    field :users, list_of(:user_type) do
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "register a new user"
    field :register_user, type: :user_type do
      arg(:input, non_null(:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end

    @desc "login a user and return JWT token"
    field :login_user, type: :session_type do
      arg(:input, non_null(:session_input_type))
      resolve(&Resolvers.SessionResolver.login_user/3)
    end

    @desc "create a post"
    field :create_post, type: :post_type do
      arg(:input, non_null(:post_input_type))
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.PostResolver.create_post/3)
    end

    @desc "create a comment"
    field :create_comment, type: :comment_type do
      arg(:input, non_null(:comment_input_type))
      middleware(Middleware.Authorize, :any)
      resolve(&Resolvers.CommentResolver.create_comment/3)
    end
  end

  # subscription do

  # end
end
