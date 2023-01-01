defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove(list) do
    tl(list)
  end

  def first(list) do
    hd(list)
  end

  def count(list) do
    count(list, 0)
  end

  defp count([], count) do
    count
  end

  defp count(list, count) do
    count(tl(list), count + 1)
  end

  def functional_list?([]) do
    false
  end

  def functional_list?(list) do
    case hd(list) do
      "Elixir" -> true
      _ -> functional_list?(tl(list))
    end
  end
end
