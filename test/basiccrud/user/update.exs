defmodule Basiccrud.User.UpdateTest do
    use Basiccrud.DataCase

    setup do
        # getting a connection w/ db
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    end
    

    describe "call/1" do
        test "when all params are valid, update a user" do
            test_user_params = %{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}

            params = %{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}
            reply =
                params 
                |> Basiccrud.User.Create.call()
            
            {:ok, %Basiccrud.User.user} = reply

            assert "1234" = %Basiccrud.User.user.id
        end
    end
end