defmodule MyList do
  def map([], _), do: []

  def map([hd | tl], f) do
    [f.(hd) | map(tl, f)]
  end

  def flat([]), do: []
  def flat([hd | tl]) when is_list(hd), do: flat(hd) ++ flat(tl)

  def flat([hd | tl]) do
    [hd | flat(tl)]
  end

  def reverse([]), do: []

  def reverse([hd | tl]) do
    append(reverse(tl), hd)
  end

  def append([], val), do: [val]

  def append([hd | tl], val), do: [hd | append(tl, val)]

  def prepend([hd | tl]), do: [hd | tl]

  def prepend([], val), do: [val]
  def prepend([hd | tl], val), do: [val | [hd | prepend(tl)]]

  def reduce([], acc, _), do: acc

  def reduce([hd | tl], acc, f) do
    res = f.(hd, acc)
    reduce(tl, res, f)
  end

  def zip([hd1 | tl1], [hd2 | tl2]), do: [{hd1, hd2} | zip(tl1, tl2)]

  def zip(_, []), do: []
  def zip([], _), do: []

  def zip([]), do: []
  def zip([[] | _]), do: []
  def zip([_ | []]), do: []

  def zip([hd | tl]) when is_list(hd) and is_list(tl) do
    [
      reduce([hd | tl], {}, fn item, acc -> Tuple.append(acc, hd(item)) end)
      | zip(get_tl([hd | tl]))
    ]
  end

  def get_tl([hd | tl]) do
    [tl(hd) | get_tl(tl)]
  end

  def get_tl([]), do: []
end
