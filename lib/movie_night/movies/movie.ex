defmodule MovieNight.Movies.Movie do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "movies" do
    field :country, :string
    field :description, :string
    field :emojis, {:array, :string}
    field :original_title, :string
    field :release_date, :date
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title, :original_title, :emojis, :description, :release_date, :country])
    |> validate_required([:title, :original_title, :emojis, :description, :release_date, :country])
  end
end

