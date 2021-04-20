defmodule TestePWeb.UsersViewTest do
  use TestePWeb.ConnCase, async: true
  import Phoenix.View
  alias TesteP.{Account, User}
  alias TestePWeb.UsersView

  test "renders create json" do
    params = %{
      name: "Rafael",
      password: "134985413958",
      nickname: "salanjinAAAA",
      email: "email@arroba.com",
      age: 19
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = TesteP.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Rafael",
        nickname: "salanjinAAAA"
      }
    }

    assert expected_response == response

  end
end
