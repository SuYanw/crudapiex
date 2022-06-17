defmodule BasiccrudWeb.GetTest do
    use Basiccrud.DataCase

    setup do
        # getting a connection w/ db
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    end

    describe "get/1" do
        test "When has sended valid params, return user" do
            test_user_params = %{
                        name: "Glaubert", 
                        password: "123456", 
                        age: 30, 
                        email: "glaubert@domain.com.br"
                    }
            
            {:ok, user} = Basiccrud.create_user(test_user_params)
            {:ok, uuid} = Map.fetch(user, :id) 

            IO.puts("http://localhost:4000/users/#{uuid}")
            #assert "uuid: #{uuid}" = "1234"

            #delete user created
            uuid
            |> Basiccrud.delete_user()
        end
    end
end