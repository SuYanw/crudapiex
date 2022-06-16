defmodule BasiccrudWeb.UserView do
    use BasiccrudWeb, :view

    def render("show.json", %{user: %Basiccrud.User{id: id, name: name, email: email, inserted_at: inserted_at, age: age}}) do
    %{
        id: id,
        name: name,
        email: email,
        inserted_at: inserted_at,
        age: age
    }
    end

    def render("update.json", %{user: %Basiccrud.User{id: id, name: name, email: email, inserted_at: inserted_at, age: age}}) do
    %{
        message: "User updated!",
        id: id,
        name: name,
        email: email,
        inserted_at: inserted_at,
        age: age
    }
    end

    def render("delete.json", _params) do
    %{
        message: "User deleted"
    }
    end

end
