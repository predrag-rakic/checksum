defmodule Digits.Worker do
  @moduledoc """
  Holds digits and performs operations on them.
  """

  @empty_sequence []
  @zero 48

  alias Digits.Validator

  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl true
  def init(_), do: {:ok, @empty_sequence}

  @doc """
  Hello world.

  ## Examples

      iex> DigitsChecksum.hello
      :world

  """
  def add(additional_digits) when is_binary(additional_digits) do
    additional_digits_list =
      additional_digits
      |> to_charlist()
      |> Enum.map(fn digit -> digit - @zero end)
      |> IO.inspect(label: "SSSSSSSSSSSSSSSS")

    with {:ok, _} <- Validator.validate_digits(additional_digits_list) do
      GenServer.call(__MODULE__, {:add, additional_digits_list})
    end
  end

  def clear do
    GenServer.call(__MODULE__, :clear)
  end

  def compute_checksum do
    GenServer.call(__MODULE__, :checksum)
  end

  @impl true
  def handle_call({:add, additional_digits_list}, _from, digits) do
    new_digits = digits ++ additional_digits_list
    {:reply, new_digits, new_digits}
  end

  @impl true
  def handle_call(:clear, _from, _digits) do
    {:reply, :ok, @empty_sequence}
  end

  @impl true
  def handle_call(:checksum, _from, digits) do

    {:reply, :checksum, digits}
  end
end
