defmodule BasiccrudWeb.UpdateTest do
    
    use BasiccrudWeb.ConnCase
    use ExUnit.Case

    setup do
        default_user_params = %{name: "Glaubert", password: "123456", age: 30, email: "glaubert@domain.com.br"}
        {:ok, %Basiccrud.User{id: id}} = Basiccrud.create_user(default_user_params)
    end

    describe "update/1" do
        test "When has sended valid parans, update user", %{conn: conn} do
            assert "1234" = id
        end
    end
end