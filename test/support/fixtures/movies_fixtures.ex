defmodule MovieNight.MoviesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MovieNight.Movies` context.
  """

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        country: "some country",
        description: "some description",
        emojis: ["option1", "option2"],
        original_title: "some original_title",
        release_date: ~U[2023-02-28 23:29:00Z],
        title: "some title"
      })
      |> MovieNight.Movies.create_movie()

    movie
  end
end
