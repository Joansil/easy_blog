defmodule EasyBlogWeb.Resolvers.SessionResolver do
  alias EasyBlog.{Accounts.Session, Guardian}

  # check if user is in database
  # if a user is registered we returna a token and a user
  def login_user(_,%{input: input},_) do
    with {:ok, user} <- Session.authenticate(input),
         {:ok, jwt_token, _} <- Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt_token, user: user}}
    end
  end
end
