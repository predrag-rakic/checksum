defmodule Digits.Worker do
  @moduledoc """
  Holds digits and performs operations on them.
  """

  @empty_sequence []
  @zero 48

  alias Digits.{Checksum, Validator}

  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @impl true
  def init(_), do: {:ok, @empty_sequence}

  @doc """
  Append digits
  """
  def add(additional_digits) when is_binary(additional_digits) do
    additional_digits_list =
      additional_digits
      |> to_charlist()
      |> Enum.map(fn digit -> digit - @zero end)

    with {:ok, _} <- Validator.validate_digits(additional_digits_list) do
      {:ok, GenServer.call(__MODULE__, {:add, additional_digits_list})}
    end
  end

  @doc """
  Clear the list content
  """
  def clear do
    GenServer.call(__MODULE__, :clear)
  end

  @doc """
  Compute checksum
  """
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
    {:reply, Checksum.compute(digits), digits}
  end
end
