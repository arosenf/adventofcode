defmodule AdventOfCode2025 do
  @moduledoc """
  Entry points and helper functions for Advent of Code 2025 solutions.

  You can use `AdventOfCode2025.run/2` to dispatch to the appropriate day's module.
  """

  @doc """
  Run the given day (1–12) with the provided input and return a tuple `{part1, part2}`.
  """
  @spec run(integer(), String.t()) :: {any(), any()}
  def run(day, input) when day in 1..12 do
    day_str = day |> Integer.to_string() |> String.pad_leading(2, "0")
    mod = Module.concat(__MODULE__, String.to_atom("Day" <> day_str))
    part1 = apply(mod, :part1, [input])
    part2 = apply(mod, :part2, [input])
    {part1, part2}
  end
end
