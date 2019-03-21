defmodule Priv.Seeds do
  def read_data(file) do
    File.read!(file)
    |> Poison.decode!(as: [%Friend.Person{}], keys: :atoms)
    |> Enum.each(fn person -> create_friend(person) end)
  end

  def create_friend(person) do
    Friend.Person.changeset(person)
  end
end

Priv.Seeds.read_data("priv/repo/seeds.json")
