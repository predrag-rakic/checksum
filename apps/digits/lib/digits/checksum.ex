defmodule Digits.Checksum do
  @moduledoc """
  Checksum computation

  1. Add up the digits in odd positions and multiply by 3
  2. Add up the digits in even positions
  3. Add up the results of 1 and 2
  4. Divide by 10 and take the remainder.
  5. If the remainder is 0 final result is 0 otherwise subtract it from 10 for final result
  """

  @doc """
  Compute checksum for list of single-digit numbers

  ## Example

      iex> compute([1, 2, 3])
      6
  """
  def compute(digits) when is_list(digits) do
    digits
    |> sum()
    |> crunch()
  end

  defp sum([]), do: {0, 0}

  defp sum([odd]), do: {odd, 0}

  defp sum([odd, even | rest]) do
    {odd_sum, even_sum} = sum(rest)
    {odd_sum + odd, even_sum + even}
  end

  defp crunch({odd_sum, even_sum}) do
    (odd_sum * 3 + even_sum)
    |> rem(10)
    |> (&rem(10 - &1, 10)).()
  end
end
