defmodule BasiccrudWeb.FallbackController do
    use BasiccrudWeb, :controller

    def call(conn, {:error, :unauthorized}) do
        conn
        |> put_status(:unauthorized)
        |> put_view(BasiccrudWeb.ErrorView)
    end
end