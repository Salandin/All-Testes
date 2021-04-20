defmodule TestePWeb.AccountsController do
  use TestePWeb, :controller
  alias TesteP.Account
  alias TesteP.Account.Transactions.Response, as: TransactionResponse

  action_fallback TestePWeb.FallbackController

  def deposit(conn, params) do
    with {:ok, %Account{} = account} <- TesteP.deposit(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def withdraw(conn, params) do
    with {:ok, %Account{} = account} <- TesteP.withdraw(params) do
      conn
      |> put_status(:ok)
      |> render("update.json", account: account)
    end
  end

  def transaction(conn, params) do
    with {:ok, %TransactionResponse{} = transaction} <- TesteP.transaction(params) do
      conn
      |> put_status(:ok)
      |> render("transaction.json", transaction: transaction)
    end
  end
end
