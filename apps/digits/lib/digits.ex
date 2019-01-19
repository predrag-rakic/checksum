defmodule Digits do
  @moduledoc """
  Calls Digits.Worker module.
  """

  defmodule Behaviour do
    @moduledoc """
    Useful for mocking Digits.
    """

    @callback add(list()) :: list()
    @callback clear() :: :ok
    @callback compute_checksum() :: integer()
  end

  alias Digits.Worker

  @behaviour Behaviour

  @doc """
  Append digits
  """
  @impl true
  def add(new_digits), do: Worker.add(new_digits)

  @doc """
  Clear the list content
  """
  @impl true
  def clear, do: Worker.clear()

  @doc """
  Compute checksum
  """
  @impl true
  def compute_checksum, do: Worker.compute_checksum()
end
