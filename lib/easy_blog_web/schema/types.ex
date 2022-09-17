defmodule EasyBlogWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias EasyBlogWeb.Schema

  import_types(Schema.UserType)
end
