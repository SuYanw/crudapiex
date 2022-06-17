defmodule Basiccrud.User.DeleteTest do
    use ExUnit.Case, async: true

    setup do
        # getting a connection w/ db
        :ok = Ecto.Adapters.SQL.Sandbox.checkout(Repo)
    end
    
    describe "call/1" do
        
        test "when user id is valid and exists, delete user" do
            assert %Post{} = Repo.insert!(%Post{})
        end
    end
end