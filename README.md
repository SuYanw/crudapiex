# Basic Crud API
This is an basic CREATE, UPDATE, DELETE REST API with ELIXIR!

Initial proposal
The initial proposial is learning Elixir and Phoenix for API dev. see bellow the options for this repository.
```
create user w/ name, pass, age
delete user by id
update user info info by user
```

### Routes
This is example for utilizing this project:
```
/api/user/user_id
/api/user/create name="name" age=22 email="user@domain.com.br" password="123456"
/api/user/update id="user-uuid" name="new_name" age=100 email="newemail@email.com.br"
/api/user/delete/user_id
```


### Mixs Test
To run tests, you can run
```
mix test/basiccrud/user/get.exs
mix test/basiccrud/user/update.exs
mix test/basiccrud/user/delete.exs
mix test/basiccrud/user/create.exs
```
# TODO
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`
  * Is recommended has installed PostgreeSQL

Now you test [`localhost:4000`](http://localhost:4000) in  your client side.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
