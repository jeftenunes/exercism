defmodule ExLog do
  def alert_recipient(code, from_legacy) do
    log_label = to_label(code, from_legacy)

    cond do
      log_label === :error or log_label === :fatal -> :ops
      log_label === :unknown and from_legacy -> :dev1
      log_label === :unknown and not from_legacy -> :dev2
      true -> false
    end
  end

  def to_label(code, from_legacy) do
    cond do
      code === 0 and not from_legacy -> :trace
      code === 0 and from_legacy -> :unknown
      code === 1 -> :debug
      code === 2 -> :info
      code === 3 -> :warning
      code === 4 -> :error
      code === 5 and not from_legacy -> :fatal
      code === 5 and from_legacy -> :unknown
      true -> :unknown
    end
  end
end
