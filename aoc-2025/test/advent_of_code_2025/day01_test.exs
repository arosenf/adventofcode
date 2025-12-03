defmodule AdventOfCode2025.Day01Test do
  use ExUnit.Case, async: true
  alias AdventOfCode2025.Day01

  @moduledoc false

  @example_input "day01_example.txt"
  @example_output_part1 3
  @example_output_part2 6
  @input "day01_input.txt"

  describe "part1/1" do
    test "returns the expected result for the example input" do
      assert Day01.part1(@example_input) == @example_output_part1
      IO.puts("Example result: #{Day01.part1(@example_input)}")
      IO.puts("Solution: #{Day01.part1(@input)}")
    end
  end

  describe "part2/1" do
    test "returns the expected result for the example input" do
      assert Day01.part2(@example_input) == @example_output_part2
      IO.puts("Example result: #{Day01.part2(@example_input)}")
      IO.puts("Solution: #{Day01.part2(@input)}")
    end
  end
end
