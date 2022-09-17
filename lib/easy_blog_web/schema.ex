defmodule EasyBlogWeb.Schema do
  use Absinthe.Schema

  alias EasyBlogWeb.Resolvers

  # import types
  import_types(EasyBlogWeb.Schema.Types)

  query do
    @desc "get a list of all users"
    field :users, list_of(:user_type) do
      # resolver
      resolve(&Resolvers.UserResolver.users/3)
    end
  end

  mutation do
    @desc "register a new user"

    field :register_user, type: :user_type do
      arg(:input, non_null (:user_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end
  end

  # subscription do

  # end
end
