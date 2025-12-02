defmodule AdventOfCode2025.Day01 do
  @moduledoc """
  Solutions for Advent of Code 2025 Day 01.

  Each function accepts a string (`input`) representing the puzzle input and returns the computed result.
  """

  alias AdventOfCode2025.Fileio

  @dial_size 100
  @dial_start 50

  @doc """
  Solve part 1 of Day 01.
  """
  def part1(input) do
    {_pos, count} =
      input
      |> Fileio.read_lines()
      |> parse_lines()
      |> (fn lines -> rotate({@dial_start, 0}, lines) end).()

      count
  end

  @doc """
  Solve part 2 of Day 01.
  """
  def part2(_input) do
    # TODO: implement the solution for part 2
    nil
  end

  defp parse_lines(lines) when is_list(lines) do
      lines
      |> Enum.map(fn line -> String.split_at(line, 1) end)
      |> Enum.map(fn {d, c} -> {d, String.to_integer(c)} end)
  end

  defp rotate({pos, zeroes}, [{dir, count} | tail]) when dir == "L" and rem(pos - count, 100) != 0 do
    rotate({rem(pos - count, 100), zeroes}, tail)
  end

  defp rotate({pos, zeroes}, [{dir, count} | tail]) when dir == "L" and rem(pos - count, 100) == 0 do
    rotate({0, zeroes + 1}, tail)
  end

  defp rotate({pos, zeroes}, [{dir, count} | tail]) when dir == "R" and rem(pos + count, 100) != 0 do
    rotate({rem(pos + count, @dial_size), zeroes}, tail)
  end

  defp rotate({pos, zeroes}, [{dir, count} | tail]) when dir == "R" and rem(pos + count, 100) == 0 do
    rotate({0, zeroes + 1}, tail)
  end

  defp rotate({pos, zeroes}, []) do
    case pos do
      0 -> {pos, zeroes + 1}
      _ -> {pos, zeroes}
    end
  end
end
