defmodule EasyBlogWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias EasyBlogWeb.Schema

  import_types(Schema.UserType)
  import_types(Schema.SessionType)
end
