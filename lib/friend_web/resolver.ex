defmodule FriendWeb.Resolver do
  use NewRelic.Tracer

  @trace :list
  def list(_root, _args, _info) do
    friends = Friend.Person |> Friend.Repo.all()
    {:ok, friends}
  end
end
