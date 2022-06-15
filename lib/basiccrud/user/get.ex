defmodule Basiccrud.User.Get do
    
    def call(%{"id" => uuid} = _params) do
        case Ecto.UUID.cast(uuid) do
            :error -> {:error, "Invalid User ID Format!"}
            {:ok, uuid} -> validate_before_fetch(uuid)
        end
    end

    def validate_before_fetch(uuid) do
        case Basiccrud.Repo.get(Basiccrud.User, uuid) do
            nil -> {:error, "User not found"}
            user -> user
        end
    end

    defp fetch_user(uuid), do: Basiccrud.Repo.get(Basiccrud.User, uuid)
end