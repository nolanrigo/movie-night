defmodule MovieNightWeb.PageController do
  use MovieNightWeb, :controller

  alias MovieNight.Movies

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    movies = Movies.list_movies
    render(conn, :home, layout: false, movies: movies)
  end
end
