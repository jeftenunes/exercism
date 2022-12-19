defmodule MyList do
  def map([], _), do: []

  def map([hd | tl], f) do
    [f.(hd) | map(tl, f)]
  end

  def flat([]), do: []

  def flat([hd | tl]) when is_list(hd) do
    flat(hd) ++ flat(tl)
  end

  def flat([hd | tl]) do
    [hd | flat(tl)]
  end

  def reverse([]), do: []

  def reverse([hd | tl]) do
    reverse(tl) ++ [hd]
  end

  def append([], val), do: [val]

  def append([hd | tl], val), do: [hd | tl ++ [val]]

  def prepend([], val), do: append([], val)

  def prepend([hd | tl], val), do: [val] ++ [hd] ++ tl

  def reduce([], acc, _), do: acc

  def reduce([hd | tl], acc, f) do
    res = f.(hd, acc)
    reduce(tl, res, f)
  end

  def zip([]), do: []
  def zip([hd | _]) when hd === [], do: []
  def zip([hd | tl]) when is_list(hd), do: zip(hd, tl)

  def zip([hd1 | tl1], [hd2 | tl2]) do
    [{hd1, hd2} | zip(tl1, tl2)]
  end
end
