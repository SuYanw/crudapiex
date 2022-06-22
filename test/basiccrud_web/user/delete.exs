defmodule BasiccrudWeb.DeleteTest do
    
    use BasiccrudWeb.ConnCase

    @default_user_params  %{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}

    describe "delete/1" do
        test "When has sended valid params, delete user", %{conn: conn} do
            
    
            {:ok, %Basiccrud.User{id: id}} = Basiccrud.create_user(@default_user_params)

            reply = 
                conn
                    |> get(Routes.user_path(conn, :delete, id))
                    |> json_response(:ok)

            assert %{"message" => "User deleted"} = reply
        end

        test "When has sended invalid params, return error", %{conn: conn} do

            #create valid UUID 
            id = Ecto.UUID.generate()

            reply = 
                conn
                    |> get(Routes.user_path(conn, :delete, id))
                    |> json_response(:bad_request)

            assert %{"message" => "User not found!"} = reply
        end
    end
end