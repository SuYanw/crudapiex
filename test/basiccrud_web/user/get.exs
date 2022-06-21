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
                |> get(Routes.user_path(conn, :show, id))
                |> json_response(:ok)
                    
            assert %{"age" => 30, "email" => "glaubert@domain.com.br", "id" => _id, "name" => "Glaubert"} = reply

            id
                |> Basiccrud.delete_user()
        end
        test "When has sended invalid id, return error", %{conn: conn} do

            id = "1234"

            reply = 
                conn
                |> get(Routes.user_path(conn, :show, id))
                |> json_response(:bad_request)
                    
            assert %{"message" => "Invalid User ID Format!"} = reply
            
        end

        test "When has sended unkown id, return error", %{conn: conn} do

            id = Ecto.UUID.generate()

            reply = 
                conn
                |> get(Routes.user_path(conn, :show, id))
                |> json_response(:bad_request)
                    
            assert %{"message" => "User not found"} = reply
            
        end
    end
end