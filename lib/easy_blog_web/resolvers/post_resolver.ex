defmodule EasyBlogWeb.Resolvers.PostResolver do
  alias EasyBlog.Posts

  def create_post(_, %{input: input}, %{context: %{current_user: current_user}}) do
    post_input = Map.merge(input, %{user_id: current_user.id})
    Posts.create_post(post_input)
  end
end
