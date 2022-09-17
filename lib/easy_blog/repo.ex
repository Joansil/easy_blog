defmodule EasyBlog.Repo do
  use Ecto.Repo,
    otp_app: :easy_blog,
    adapter: Ecto.Adapters.Postgres
end
