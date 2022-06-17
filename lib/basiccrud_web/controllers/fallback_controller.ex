defmodule BasiccrudWeb.FallbackController do
    use BasiccrudWeb, :controller

    def call(conn, {:error, :unauthorized}) do
        conn
        |> put_status(:unauthorized)
        |> put_view(BasiccrudWeb.ErrorView)
    end

    def call(conn, {:error, result}) do
        conn
        |> put_status(:bad_request)
        |> put_view(BasiccrudWeb.ErrorView)
        |> render("400.json", result: result)
    end
end
