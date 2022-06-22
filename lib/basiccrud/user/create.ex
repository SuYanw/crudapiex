defmodule Basiccrud.User.Create do

  def call(params) do
    params

    |> Basiccrud.User.build()
    |> validate_before_create()
  end

  defp validate_before_create({:ok, struct}), do: Basiccrud.Repo.insert(struct)

  defp validate_before_create({:error, _struct} = error) do
    {:error, %Ecto.Changeset{errors: [errors]}} = error
    {atom, _msg} = errors

    atom
    |> validate_errors()
  end

  defp validate_errors(atom) do
    case atom do
      :password -> "Password field is missing"
      :name -> "Name field is missing"
      :age -> "User age is missing"
      :email -> "User email is missing"
    end
  end
end
