defmodule PhoenixHotwire.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_hotwire,
    adapter: Ecto.Adapters.Postgres
end
