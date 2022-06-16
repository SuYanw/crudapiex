defmodule BasiccrudWeb.UserController do
    use BasiccrudWeb, :controller

    import Plug.Conn

    def show(conn, %{"userid" => id}) do
        id
        |> Basiccrud.get_user()
        |> handle_response(conn, "show.json", :ok)
    end

    def update(conn, params) do
        params
        |> Basiccrud.update_user()
        |> handle_response(conn, "show.json", :ok)
    end

    def create(conn, params) do
      params
      |> Basiccrud.create_user()
      |> handle_response(conn, "show.json", :ok)
    end

    defp handle_response({:ok, user}, conn, view, status) do
        conn
        |> put_status(status)
        |> render(view, user: user)
    end

    defp handle_response({:error, __changeset} = error, __conn, _view, _status), do: error
end
