defmodule Digits.Worker do
  @moduledoc """
  Holds digits and performs operations on them.
  """

  @zero 48

  alias Digits.Validator

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
  def add(new_digits) when is_binary(new_digits) do
    new_digits_list =
      new_digits
      |> to_charlist()
      |> Enum.map(fn digit -> digit - @zero end)
      |> IO.inspect(label: "SSSSSSSSSSSSSSSS")

    with {:ok, _} <- Validator.validate_digits(new_digits_list) do
      GenServer.call(__MODULE__, {:add, new_digits_list})
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
