defmodule Basiccrud.User.UpdateTest do
    use Basiccrud.DataCase

    setup do
        # getting a connection w/ db
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    end
    

    describe "call/1" do

        test "when all params are valid, update a user" do
            test_user_params = %{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}
            
            {:ok, user} = Basiccrud.User.Create.call(test_user_params)
            {:ok, uuid} = Map.fetch(user, :id) 

            new_user_params = %{"id" => uuid, "name" => "newname"}

            response = Basiccrud.update_user(new_user_params)

            assert {:ok, %Basiccrud.User{name: "newname"}} = response

            #delete user created
            uuid
            |> Basiccrud.delete_user()
        end

        test "when has no valid uuid, return errors" do

            new_user_params = %{"id" => "invalid_uuid", "name" => "newname"}

            response = Basiccrud.update_user(new_user_params)

            assert {:error, "Invalid User ID Format!"} = response
        end

    end
end