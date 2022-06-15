defmodule Basiccrud.User.Get do
    
    def call(uuid) do
        case Ecto.UUID.cast(uuid) do
            :error -> {:error, "Invalid User ID Format!"}
            {:ok, uuid} -> validate_before_fetch(uuid)
        end
    end

    def validate_before_fetch(uuid) do
        case Basiccrud.Repo.get(Basiccrud.User, uuid) do
            nil -> {:error, "User not found"}
            user -> {:ok, user}
        end
    end

end