defmodule TesteP.NumbersTest do
  use ExUnit.Case
  alias TesteP.Numbers

  describe "sum_do_arq/1" do
    test "when ther is a file with the given name, returns the sum of nums" do
      response = Numbers.sum_do_arq("numbers")

      expected_response = {:ok, %{result: 37}}

      assert response == expected_response
    end

    test "when ther is not file with the given name, returns an error" do
      response = Numbers.sum_do_arq("bananas")

      expected_response = {:error, %{message: "Arquivo errado."}}

      assert response == expected_response
    end
  end
end
