defmodule FriendWeb.Type do
  use Absinthe.Schema.Notation

  object :friends do
    field(:friends, list_of(:friend)) do
      resolve(&FriendWeb.Resolver.list/3)
    end
  end

  object :friend do
    field(:id, non_null(:id))
    field(:first_name, non_null(:string))
    field(:last_name, non_null(:string))
    field(:age, non_null(:integer))
  end
end
