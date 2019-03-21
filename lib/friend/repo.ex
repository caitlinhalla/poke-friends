defmodule Friend.Repo do
  use Ecto.Repo,
    otp_app: :friend,
    adapter: Ecto.Adapters.Postgres
end
