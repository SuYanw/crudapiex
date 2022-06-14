defmodule Basiccrud.User.Create do


  def call(params) do
    params
    |> validate_before_create()
    |> Basiccrud.User.build()
  end

  defp validate_before_create({:ok, struct}) do
    struct

    |> Basiccrud.Repo.insert()
  end

  defp validate_before_create({:error, _struct} = error), do:  error
end
