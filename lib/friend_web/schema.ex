defmodule FriendWeb.Schema do
  use Absinthe.Schema

  import_types(FriendWeb.Type)

  query do
    import_fields(:friends)
  end
end
