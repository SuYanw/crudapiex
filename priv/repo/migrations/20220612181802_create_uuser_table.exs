defmodule Basiccrud.Repo.Migrations.CreateUuserTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :password, :string
      add :email, :string
      add :age, :integer

      timestamps()
    end
  end
end
