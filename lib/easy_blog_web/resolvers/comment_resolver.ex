defmodule EasyBlogWeb.Resolvers.CommentResolver do
  alias EasyBlog.Comments

  def create_comment(_, %{input: input}, %{context: %{current_user: current_user}}) do
    comment_input = Map.merge(input, %{user_id: current_user.id})
    Comments.create_comment(comment_input)
  end
end
