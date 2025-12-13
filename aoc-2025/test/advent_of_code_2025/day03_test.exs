defmodule AdventOfCode2025.Day03Test do
  use ExUnit.Case, async: true
  alias AdventOfCode2025.Day03

  @moduledoc false

  @example_input "day03_example.txt"
  @example_output_part1 357
  @example_output_part2 3121910778619
  @input "day03_input.txt"

  describe "part1/3" do
    test "returns the expected result for the example input" do
      assert Day03.part1(@example_input) == @example_output_part1
      IO.puts("[part1/3] Example result: #{Day03.part1(@example_input)}")
      IO.puts("[part1/3] Solution: #{Day03.part1(@input)}")
    end
  end

  describe "part2/3" do
    test "returns the expected result for the example input" do
      assert Day03.part2(@example_input) == @example_output_part2
      IO.puts("[part2/3] Example result: #{Day03.part2(@example_input)}")
      IO.puts("[part2/3] Solution: #{Day03.part2(@input)}")
    end
  end
end
