defmodule LinkedList do
  defstruct data: nil, next: nil

  def new() do
    nil
  end

  def new(data) do
    %__MODULE__{data: data}
  end

  def push(curr = %__MODULE__{next: _}, data) do
    new = new(data)
    %{new | next: curr}
  end

  def push(nil, data), do: new(data)

  def head(%__MODULE__{data: data}), do: data

  def traverse(nil), do: []

  def traverse(%__MODULE__{data: data, next: next}) do
    [data | traverse(next)]
  end

  def find(nil, _), do: :ok

  def find(curr = %__MODULE__{data: _, next: _}, val) do
    if curr.data === val do
      curr
    end
  end

  def is_empty(nil), do: true

  def is_empty(%__MODULE__{}), do: false
end
