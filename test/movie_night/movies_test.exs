defmodule MovieNight.MoviesTest do
  use MovieNight.DataCase

  alias MovieNight.Movies

  describe "movies" do
    alias MovieNight.Movies.Movie

    import MovieNight.MoviesFixtures

    @invalid_attrs %{country: nil, description: nil, emojis: nil, original_title: nil, release_date: nil, title: nil}

    test "list_movies/0 returns all movies" do
      movie = movie_fixture()
      assert Movies.list_movies() == [movie]
    end

    test "get_movie!/1 returns the movie with given id" do
      movie = movie_fixture()
      assert Movies.get_movie!(movie.id) == movie
    end

    test "create_movie/1 with valid data creates a movie" do
      valid_attrs = %{country: "some country", description: "some description", emojis: ["option1", "option2"], original_title: "some original_title", release_date: ~U[2023-02-28 23:29:00Z], title: "some title"}

      assert {:ok, %Movie{} = movie} = Movies.create_movie(valid_attrs)
      assert movie.country == "some country"
      assert movie.description == "some description"
      assert movie.emojis == ["option1", "option2"]
      assert movie.original_title == "some original_title"
      assert movie.release_date == ~U[2023-02-28 23:29:00Z]
      assert movie.title == "some title"
    end

    test "create_movie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Movies.create_movie(@invalid_attrs)
    end

    test "update_movie/2 with valid data updates the movie" do
      movie = movie_fixture()
      update_attrs = %{country: "some updated country", description: "some updated description", emojis: ["option1"], original_title: "some updated original_title", release_date: ~U[2023-03-01 23:29:00Z], title: "some updated title"}

      assert {:ok, %Movie{} = movie} = Movies.update_movie(movie, update_attrs)
      assert movie.country == "some updated country"
      assert movie.description == "some updated description"
      assert movie.emojis == ["option1"]
      assert movie.original_title == "some updated original_title"
      assert movie.release_date == ~U[2023-03-01 23:29:00Z]
      assert movie.title == "some updated title"
    end

    test "update_movie/2 with invalid data returns error changeset" do
      movie = movie_fixture()
      assert {:error, %Ecto.Changeset{}} = Movies.update_movie(movie, @invalid_attrs)
      assert movie == Movies.get_movie!(movie.id)
    end

    test "delete_movie/1 deletes the movie" do
      movie = movie_fixture()
      assert {:ok, %Movie{}} = Movies.delete_movie(movie)
      assert_raise Ecto.NoResultsError, fn -> Movies.get_movie!(movie.id) end
    end

    test "change_movie/1 returns a movie changeset" do
      movie = movie_fixture()
      assert %Ecto.Changeset{} = Movies.change_movie(movie)
    end
  end
end
