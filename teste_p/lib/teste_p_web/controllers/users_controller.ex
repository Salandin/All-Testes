defmodule TestePWeb.UsersController do
  use TestePWeb, :controller
  alias TesteP.User

  action_fallback TestePWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- TesteP.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
