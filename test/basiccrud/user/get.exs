defmodule Basiccrud.User.GetTest do
    use Basiccrud.DataCase


    describe "call/1" do
        test "When the id is valid, get info user" do
            test_user_params = %{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}
            
            {:ok, user} = Basiccrud.User.Create.call(test_user_params)
            {:ok, uuid} = Map.fetch(user, :id) 

            response =
                uuid
                |> Basiccrud.get_user()        
            
            assert {:ok, %Basiccrud.User{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}} = response

            #delete user created
            uuid
            |> Basiccrud.delete_user()
        end

        test "When the id is invalid, return a error" do

            uuid = Ecto.UUID.generate()

            response =
                uuid
                |> Basiccrud.get_user()        
            
            assert {:error, _struct} = response

            #delete user created
            uuid
            |> Basiccrud.delete_user()
        end
    end
end