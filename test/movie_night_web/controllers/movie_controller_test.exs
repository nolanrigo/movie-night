defmodule MovieNightWeb.MovieControllerTest do
  use MovieNightWeb.ConnCase

  import MovieNight.MoviesFixtures

  @create_attrs %{country: "some country", description: "some description", emojis: ["option1", "option2"], original_title: "some original_title", release_date: ~U[2023-02-28 23:29:00Z], title: "some title"}
  @update_attrs %{country: "some updated country", description: "some updated description", emojis: ["option1"], original_title: "some updated original_title", release_date: ~U[2023-03-01 23:29:00Z], title: "some updated title"}
  @invalid_attrs %{country: nil, description: nil, emojis: nil, original_title: nil, release_date: nil, title: nil}

  describe "index" do
    test "lists all movies", %{conn: conn} do
      conn = get(conn, ~p"/movies")
      assert html_response(conn, 200) =~ "Listing Movies"
    end
  end

  describe "new movie" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/movies/new")
      assert html_response(conn, 200) =~ "New Movie"
    end
  end

  describe "create movie" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/movies", movie: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/movies/#{id}"

      conn = get(conn, ~p"/movies/#{id}")
      assert html_response(conn, 200) =~ "Movie #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/movies", movie: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Movie"
    end
  end

  describe "edit movie" do
    setup [:create_movie]

    test "renders form for editing chosen movie", %{conn: conn, movie: movie} do
      conn = get(conn, ~p"/movies/#{movie}/edit")
      assert html_response(conn, 200) =~ "Edit Movie"
    end
  end

  describe "update movie" do
    setup [:create_movie]

    test "redirects when data is valid", %{conn: conn, movie: movie} do
      conn = put(conn, ~p"/movies/#{movie}", movie: @update_attrs)
      assert redirected_to(conn) == ~p"/movies/#{movie}"

      conn = get(conn, ~p"/movies/#{movie}")
      assert html_response(conn, 200) =~ "some updated country"
    end

    test "renders errors when data is invalid", %{conn: conn, movie: movie} do
      conn = put(conn, ~p"/movies/#{movie}", movie: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Movie"
    end
  end

  describe "delete movie" do
    setup [:create_movie]

    test "deletes chosen movie", %{conn: conn, movie: movie} do
      conn = delete(conn, ~p"/movies/#{movie}")
      assert redirected_to(conn) == ~p"/movies"

      assert_error_sent 404, fn ->
        get(conn, ~p"/movies/#{movie}")
      end
    end
  end

  defp create_movie(_) do
    movie = movie_fixture()
    %{movie: movie}
  end
end
