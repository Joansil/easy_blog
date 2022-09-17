defmodule EasyBlogWeb.Schema.Types do
  use Absinthe.Schema.Notation

  alias EasyBlogWeb.Schema.Types

  import_types(Types.Usertype)
end
