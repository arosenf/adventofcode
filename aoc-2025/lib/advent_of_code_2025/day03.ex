defmodule AdventOfCode2025.Day03 do
  @moduledoc """
  Solutions for Advent of Code 2025 Day 02.

  Each function accepts a string (`input`) representing the puzzle input and returns the computed result.
  """

  alias AdventOfCode2025.Fileio

  @doc """
  Solve part 1 of Day 03.
  """
  def part1(input) do
    solve(input, &maximize_bank_1/1)
  end

  @doc """
  Solve part 2 of Day 03.
  """
  def part2(input) do
    solve(input, &maximize_bank_2/1)
  end

  defp solve(input, f) do
    input
    |> Fileio.read_lines()
    |> Enum.map(fn line -> f.(line) end)
    |> Enum.sum()
  end

  defp maximize_bank_1(bank) when is_bitstring(bank) do
    batteries =
      bank
      |> String.to_charlist()
      # Convert ASCII character codes to integers
      |> Enum.map(fn c -> c - ?0 end)
      |> Enum.with_index()

    {ten, idx} =
      batteries
      |> Enum.slice(0, length(batteries) - 1)
      |> Enum.max_by(fn {b, _} -> b end)

    {one, _} =
      batteries
      |> Enum.slice(idx + 1, length(batteries) - idx - 1)
      |> Enum.max_by(fn {b, _} -> b end)

    # IO.puts("Batteries #{bank} - Selected digits: #{ten}#{one}")
    ten * 10 + one
  end

  defp maximize_bank_2(bank) when is_bitstring(bank) do
    0
  end
end
