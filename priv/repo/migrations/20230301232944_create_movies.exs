defmodule MovieNight.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :title, :string
      add :original_title, :string
      add :emojis, {:array, :string}
      add :description, :string
      add :release_date, :date
      add :country, :string

      timestamps()
    end
  end
end
