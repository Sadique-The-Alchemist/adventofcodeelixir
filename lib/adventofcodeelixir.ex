defmodule Adventofcodeelixir do
  @moduledoc """
  Documentation for `Adventofcodeelixir`.
  """

  @regex_for_mul ~r/mul\((\d+),(\d+)\)/
def day3part1(input) do
  input
  |>parse_mul_lines()
  |>calculate_product()
end
defp parse_mul_lines(input) do
  Regex.scan(@regex_for_mul, input)
end

def day3part2(input) do
  input
  |> parse_enabled_mul_lines()
  |> parse_mul_lines()
  |>calculate_product()

end
defp parse_enabled_mul_lines(input) do

  partialy_enabled = String.split(input, ["don't"])
  already_enabled = hd(partialy_enabled)
  partialy_enabled
  |>tl()
  |>Enum.map(fn doable ->
    doable
    |>String.split("do")
    |>tl()
  end)
  |>List.insert_at(0, already_enabled)
  |>List.to_string()
end
defp calculate_product(mul_lines) do
  mul_lines
  |>Enum.map(fn [_mul, left, right] ->
   String.to_integer(left) * String.to_integer(right)
  end)
  |>Enum.sum()
  end
end
