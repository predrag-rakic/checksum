defmodule Digits.Worker do
  @moduledoc """
  Holds digits and performs operations on them.
  """

  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  @impl true
  def init(_), do: {:ok, ""}

  @doc """
  Hello world.

  ## Examples

      iex> DigitsChecksum.hello
      :world

  """
  def add(new_digits) do
    with {:ok, _} <- validate_digits(new_digits) do
      GenServer.call(__MODULE__, {:add, new_digits})
    end
  end

  def clear do
    GenServer.call(__MODULE__, :clear)
  end

  def compute_checksum do
    GenServer.call(__MODULE__, :checksum)
  end

  @impl true
  def handle_call(:add, _from, digits) do
    new_digits = digits
    {:reply, :ok, new_digits}
  end

  @impl true
  def handle_call(:clear, _from, _digits) do
    {:reply, :ok, ""}
  end

  @impl true
  def handle_call(:checksum, _from, digits) do
    {:reply, :checksum, digits}
  end
end
