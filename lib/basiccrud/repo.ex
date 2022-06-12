defmodule Basiccrud.Repo do
  use Ecto.Repo,
    otp_app: :basiccrud,
    adapter: Ecto.Adapters.Postgres
end
