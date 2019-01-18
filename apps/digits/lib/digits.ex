defmodule Digits do
  @moduledoc """
  Calls Digits.Worker module.
  """

  alias Digits.Worker

  @doc """
  Append digits
  """
  def add(new_digits), do: Worker.add(new_digits)

  @doc """
  Clear the list content
  """
  def clear, do: Worker.clear()

  @doc """
  Compute checksum
  """
  def compute_checksum, do: Worker.compute_checksum()
end
