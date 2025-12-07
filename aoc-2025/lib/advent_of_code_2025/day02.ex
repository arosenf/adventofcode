defmodule AdventOfCode2025.Day02 do
  @moduledoc """
  Solutions for Advent of Code 2025 Day 02.

  Each function accepts a string (`input`) representing the puzzle input and returns the computed result.
  """

  alias AdventOfCode2025.Fileio

  @doc """
  Solve part 1 of Day 02.
  """
  def part1(input) do
    input
    |> Fileio.read_lines()
    |> parse_lines()
  end

  @doc """
  Solve part 2 of Day 02.
  """
  def part2(_input) do
    # TODO: implement the solution for part 2
    nil
  end

  defp parse_lines(lines) when is_list(lines) do
    lines
    |> Enum.flat_map(fn line -> String.split(line, ",") end)
    |> Enum.map(fn interval -> String.split(interval, "-") end)
    |> Enum.map(fn [from, to] -> String.to_integer(from)..String.to_integer(to) end)
    |> Enum.map(fn range -> Enum.reduce(range, 0, fn id, acc -> id_value(id, acc) end) end)
    |> Enum.sum()
  end

  # Properties of the IDs we are looking for:
  #   - Cannot start with 0
  #   - Must be of even length
  #   - After splitting in half, both halves must be equal
  defp id_value(id, acc) when is_integer(id) do
    candidate = Integer.to_string(id)

    cond do
      String.starts_with?(candidate, "0") ->
        acc

      rem(String.length(candidate), 2) == 1 ->
        acc

      String.split_at(candidate, div(String.length(candidate), 2))
      |> (fn {first_half, second_half} -> first_half != second_half end).() ->
        acc

      true ->
        id + acc
    end
  end
end
