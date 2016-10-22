defmodule NextApi.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :name, :string
      add :color, :string
      add :size, :integer

      timestamps()
    end

  end
end
