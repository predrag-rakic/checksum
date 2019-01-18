defmodule Digits.Validator do
  @moduledoc """
  Input list validator
  """

  @doc """
  Returns error if list contains anything but single-digit number.

  ## Examaple

      iex> validate_digits([1, 2, 3, 4, 5])
      {:ok, ""}

      iex> validate_digits([:a, 2, 3, 14, 5])
      {:error, "Error in position(s): [0, 3]"}
  """
  def validate_digits(digits) when is_list(digits) do
    digits
    |> Enum.map(fn digit -> digit in 0..9 end)
    |> Enum.with_index()
    |> Enum.filter(fn {digit?, _} -> not digit? end)
    |> Enum.map(fn {_, i} -> i end)
    |> case do
      [] -> {:ok, ""}
      error -> {:error, "Error in position(s): #{inspect(error)}"}
    end
  end
end
