defmodule Basiccrud.User.CreateTest do
    use Basiccrud.DataCase

    setup do
        # getting a connection w/ db
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    end
    
    describe "call/1" do

        test "when all params are valid, create a user" do
            
            params = %{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}
            reply =
                params 
                |> Basiccrud.User.Create.call()

            assert {:ok, %Basiccrud.User{name: "Glaubert", password: "123456"}} = reply
        end

        test "when any param ins invalid, returns error" do
            params = %{name: "Glaubert", password: "123456", age: 30, email: 22}
            reply =
                params 
                |> Basiccrud.User.Create.call()

            assert {:error, changeset} = reply
            assert errors_on(changeset) == %{email: ["is invalid"]}   
        end
        
    end
end