defmodule HttpApi.DigitsClient do
  @moduledoc """
  Application logic client.

  Also, compile time dispatch for application logic mocking.
  """

  if Mix.env() == :test do
    Mox.defmock(DigitsMock, for: Digits.Behaviour)

    def engine, do: DigitsMock
  else
    def engine, do: Digits
  end

  def add(digits), do: engine().add(digits)
  def clear, do: engine().clear()
  def compute_checksum, do: engine().compute_checksum()
end
