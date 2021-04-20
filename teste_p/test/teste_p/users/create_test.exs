defmodule TesteP.User.CreateTest do
  use TesteP.DataCase, async: true

  alias TesteP.User
  alias TesteP.User.Create

  describe "call/1" do
    test "when all valid, return user" do
      params = %{
        name: "Rafael",
        password: "134985413958",
        nickname: "salanjinAAAA",
        email: "email@arroba.com",
        age: 19
      }

      {:ok, %User{id: user_id}} = Create.call(params)
      user = Repo.get(User, user_id)

      assert %User{ id: ^user_id,
        name: "Rafael",
        age: 19 } = user
    end

    test "when there is a invalid params, return error" do
      params = %{
        name: "Rafael",
        nickname: "salanjinAAAA",
        email: "email@arroba.com",
        age: 9
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response

    end
  end
end
