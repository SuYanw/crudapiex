defmodule Basiccrud.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "users" do
    field :name, :string
    field :password, :string
    field :age, :integer
    field :email, :string
    timestamps()
  end

  @required_params [:name, :password, :age, :email]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)

  defp create_changeset(module, params) do

    module
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end


end
