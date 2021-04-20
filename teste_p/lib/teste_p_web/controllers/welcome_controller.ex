defmodule TestePWeb.WelcomeController do
  use TestePWeb, :controller
  alias TesteP.Numbers

  def index(conn, %{"filename" => filename}) do
    filename
    |> Numbers.sum_do_arq()
    |> handle_response(conn)
  end

  defp handle_response({:ok, %{result: result}}, conn) do
    conn
    |> put_status(:ok)
    |> json( %{message: "Welcome to teste p api. this is your number:: #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end
end
