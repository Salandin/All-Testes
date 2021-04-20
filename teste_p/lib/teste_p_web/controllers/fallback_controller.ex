defmodule TestePWeb.FallbackController do
  use TestePWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(TestePWeb.ErrorView)
    |> render("400.json", result: result)
  end

end
