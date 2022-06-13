defmodule Basiccrud.User.Create do


  def call(params) do
    params
    |> Basiccrud.User.build()
    |> validate_before_create()
  end

  defp validate_before_create({:ok, struct}), do: Basiccrud.Repo.insert(struct)

  defp validate_before_create({:error, _struct} = error), do:  error
end
