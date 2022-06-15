defmodule Basiccrud do

  alias Basiccrud.User

  defdelegate create_user(params), to: User.Create, as: :call
  defdelegate delete_user(params), to: User.Delete, as: :call
  defdelegate update_user(params), to: User.Update, as: :call
end
