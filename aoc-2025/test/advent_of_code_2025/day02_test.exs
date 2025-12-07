defmodule AdventOfCode2025.Day02Test do
  use ExUnit.Case, async: true
  alias AdventOfCode2025.Day02

  @moduledoc false

  @example_input "day02_example.txt"
  @example_output_part1 1227775554
  @example_output_part2 0
  @input "day02_input.txt"

  describe "part1/2" do
    test "returns the expected result for the example input" do
      assert Day02.part1(@example_input) == @example_output_part1
      IO.puts("[part1/2] Example result: #{Day02.part1(@example_input)}")
      IO.puts("[part1/2] Solution: #{Day02.part1(@input)}")
    end
  end

  describe "part2/2" do
    test "returns the expected result for the example input" do
      assert Day02.part2(@example_input) == @example_output_part2
      IO.puts("[part2/2] Example result: #{Day02.part2(@example_input)}")
      IO.puts("[part2/2] Solution: #{Day02.part2(@input)}")
    end
  end
end
