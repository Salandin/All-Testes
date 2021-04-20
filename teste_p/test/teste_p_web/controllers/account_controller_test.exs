defmodule TestePWeb.AccountsControllerTest do
  use TestePWeb.ConnCase, async: true
  alias TesteP.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Rafael",
        password: "134985413958",
        nickname: "salanjinAAAA",
        email: "email@arroba.com",
        age: 19
      }

      {:ok, %User{account: %Account{id: account_id}}} = TesteP.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic Um9ic29uOlNlbmg0UGljNGRvUm9i")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params valid, deposit it", %{conn: conn, account_id: account_id} do
      params = %{"value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert %{
        "account" => %{"balance" => "50.00", "id" => _id},
        "message" => "Ballance changed successfully"
       } = response
    end

    test "when there are valid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value"}
      assert response == expected_response
    end
  end
end
