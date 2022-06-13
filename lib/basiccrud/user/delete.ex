defmodule Basiccrud.User.Delete do

  def call(uuid) do
    uuid
    |> validate_before_delete()
  end

  def validate_before_delete(uuid) do
    case get_user_info(uuid) do
      nil -> {:error, "User not found!"}
      users-> Basiccrud.Repo.delete(users)
    end
  end

  def get_user_info(uuid), do: Basiccrud.Repo.get(Basiccrud.User, uuid)
end
