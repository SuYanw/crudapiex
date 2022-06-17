defmodule Basiccrud.User.DeleteTest do
    use Basiccrud.DataCase

    setup do
        # getting a connection w/ db
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    end
    
    describe "call/1" do

        test "when the user id is valid, delete a user" do
            test_user_params = %{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}
            
            {:ok, user} = Basiccrud.User.Create.call(test_user_params)
            {:ok, uuid} = Map.fetch(user, :id) 

            response =
                uuid
                |> Basiccrud.delete_user()

            assert {:ok, _struct} = response

        end

        test "when the user id is not valid, return error" do

            uuid = Ecto.UUID.generate()

            response =
                uuid
                |> Basiccrud.delete_user()

            assert {:error, "User not found!"} = response

        end
    end
end