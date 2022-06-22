defmodule BasiccrudWeb.UpdateTest do
    
    use BasiccrudWeb.ConnCase
    use ExUnit.Case

    @default_user_params %{
                            name: "Glaubert", 
                            password: "123456", 
                            age: 30, 
                            email: "glaubert@domain.com.br"
                        }

    describe "update/1" do

        test "When has sended valid parans, update user", %{conn: conn} do

            {:ok, %Basiccrud.User{id: id}} = Basiccrud.create_user(@default_user_params)

            update_params_User = %{
                            name: "AnotherName", 
                            password: "123456", 
                            age: 25, 
                            email: "anothermail@domain.com.br"   
                        }

            new_struct = Map.put(update_params_User, :id, id)

            conn
            |> post(Routes.user_path(conn, :update, new_struct))
            |> json_response(:ok)

            assert _new_struct = Basiccrud.Repo.get(Basiccrud.User, id)

            id
            |> Basiccrud.delete_user()

        end

        test "When has sended invalid params, return error", %{conn: conn} do

            id = Ecto.UUID.generate()

            update_params_User = %{
                            name: "AnotherName", 
                            password: "123456", 
                            age: 25, 
                            email: "anothermail@domain.com.br"   
                        }

            new_struct = Map.put(update_params_User, :id, id)
            
            reply =
                conn
                    |> post(Routes.user_path(conn, :update, new_struct))
                    |> json_response(:bad_request)

            #assert new_struct = Basiccrud.Repo.get(Basiccrud.User, id)
            assert %{"message" => "User not found!"} = reply

        end

    end
end