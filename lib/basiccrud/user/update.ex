defmodule Basiccrud.User.Update do



  def call(%{"id"=> uuid} = params) do
    case Ecto.UUID.cast(uuid) do
      :error -> {:error, "Invalid User ID Format!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case Basiccrud.Repo.get(Basiccrud.User, uuid) do
      nil -> {:error, "User not found!"}
      user -> update_user(user, params)
    end
  end

  defp update_user(user, params) do
    user
    |> Basiccrud.User.changeset(params)
    |> Basiccrud.Repo.update()
  end
end
