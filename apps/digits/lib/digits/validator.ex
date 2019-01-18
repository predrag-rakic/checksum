defmodule Digits.Validator do
  @moduledoc """

  """

  def validate_digits(digits) do
    digits
    |> Enum.map(fn digit -> 0 <= digit and digit < 9 end)
    |> Enum.with_index()
    |> Enum.filter(fn {digit?, _} -> not digit? end)
    |> Enum.map(fn {_, i} -> i end)
    |> case do
      [] -> {:ok, ""}

      error -> {:error, "Error on position(s): #{inspect error}"}
    end
  end
end
