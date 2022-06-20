defmodule BasiccrudWeb.GetTest do

    use BasiccrudWeb.ConnCase

    setup do
        # getting a connection w/ db
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Basiccrud.Repo)
    end

    describe "get/1" do
        test "When has sended valid params, return user", %{conn: conn} do

            

            test_user_params = %{
                        name: "Glaubert", 
                        password: "123456", 
                        age: 30, 
                        email: "glaubert@domain.com.br"
                    }
            
            {:ok, user} = Basiccrud.create_user(test_user_params)
            {:ok, userid} = Map.fetch(user, :id) 

           reply =
               conn
               |> Routes.user_path(:show, %Basiccrud.User{id: userid})


            assert "123" == userid

            #delete user created
            # uuid
            # |> Basiccrud.delete_user()
        end
    end
end