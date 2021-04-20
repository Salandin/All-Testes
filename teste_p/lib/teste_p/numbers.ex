defmodule TesteP.Numbers do
  def sum_do_arq(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Enum.map(fn num -> String.to_integer(num) end)
      |> Enum.sum()
    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Arquivo errado."}}
end
