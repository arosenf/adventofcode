defmodule AdventOfCode2025.Fileio do
  @moduledoc """
  Utility module for reading input files for Advent of Code challenges.
  """

  @doc """
  Reads the content of the input file for the given day.
  """
  def read_lines(file) do
    file = "inputs/#{file}"

    case File.read(file) do
      {:ok, content} -> String.split(content, "\n", trim: true)
      {:error, reason} -> raise "Failed to read input file #{file}: #{reason}"
    end
  end
end
