defmodule MovieNight.Repo do
  use Ecto.Repo,
    otp_app: :movie_night,
    adapter: Ecto.Adapters.SQLite3
end
