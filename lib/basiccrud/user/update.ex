defmodule Basiccrud.User.Update do



  def call(%{"id"=> uuid} = params) do
    case Ecto.UUID.cast(uuid) do
      :error -> {:error, "Invalid User ID Format!"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(params) do
    outfile =
      params
      |> Basiccrud.User.changeset()
    outfile
  end
end
