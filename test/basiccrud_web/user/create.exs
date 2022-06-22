defmodule BasiccrudWeb.CreateTest do

    use BasiccrudWeb.ConnCase

    setup do
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Basiccrud.Repo)
    end

    describe "create/1" do
        test "When has sended valid params, create user", %{conn: conn} do

            test_user_params = %{
                        "name" => "Glaubert", 
                        "password" => "123456", 
                        "age" => 30, 
                        "email" => "glaubert@domain.com.br"
                    }
            
            reply = 
                conn
                |> post(Routes.user_path(conn, :create, test_user_params))
                |> json_response(:ok)
                    
            assert %{"age" => 30, "email" => "glaubert@domain.com.br", "id" => id, "name" => "Glaubert"}= reply

            #delete user-test
            id
                |> Basiccrud.delete_user()
        end

        test "When has sended invalid params, create user", %{conn: conn} do

            test_user_params = %{
                        "name" => "Glaubert", 
                        "age" => 30, 
                        "email" => "glaubert@domain.com.br"
                    }
            
            reply = 
                conn
                |> post(Routes.user_path(conn, :create, test_user_params))
                |> json_response(:bad_request)

            assert %{"message" => "Password field is missing"} = reply

        end
    end
end