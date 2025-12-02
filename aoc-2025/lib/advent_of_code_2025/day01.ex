defmodule AdventOfCode2025.Day01 do
  @moduledoc """
  Solutions for Advent of Code 2025 Day 01.

  Each function accepts a string (`input`) representing the puzzle input and returns the computed result.
  """

  alias AdventOfCode2025.Fileio

  @dial_size 100
  @dial_start 50
  @sign %{"L" => -1, "R" => 1}

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

  defp rotate({pos, zeroes}, [{dir, count} | tail]) do
    delta = @sign[dir] * count
    new_pos = rem(pos + delta, @dial_size)
    new_zeroes =
      case new_pos do
        0 -> zeroes + 1
        _ -> zeroes
      end

    rotate({new_pos, new_zeroes}, tail)
  end

  defp rotate({pos, zeroes}, []) do
    case pos do
      0 -> {pos, zeroes + 1}
      _ -> {pos, zeroes}
    end
  end
end
