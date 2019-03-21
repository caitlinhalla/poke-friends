defmodule Friends.Schema do
  use Absinthe.Schema

  import_types(Friend.Type)

  query do
    import_fields(:friends)
  end
end
