defmodule EasyBlog.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `EasyBlog.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        content: "some content",
        published: true,
        title: "some title"
      })
      |> EasyBlog.Blog.create_post()

    post
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> EasyBlog.Blog.create_comment()

    comment
  end
end
