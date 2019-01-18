defmodule Digits do
  @moduledoc """
  Documentation for Digits.
  """

  alias Digits.Worker

  @doc """
  """
  def add(new_digits), do: Worker.add(new_digits)

  def clear, do: Worker.clear()

  def compute_checksum, do: Worker.compute_checksum()
end
