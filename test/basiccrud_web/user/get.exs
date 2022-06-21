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
            
            {:ok, %Basiccrud.User{id: id}} = Basiccrud.create_user(test_user_params)

           reply =
               conn
               |> Basiccrud.User.Get.validate_before_fetch(Routes.user_path(conn, :show, id))
               |> json_response(:ok)

            assert %{
                    "id" => _id, 
                    "name" => 
                    } = reply

            #delete user created
            # uuid
            # |> Basiccrud.delete_user()
        end
    end
end