defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  @spec remaining_minutes_in_oven(integer) :: integer
  def remaining_minutes_in_oven(time_in_oven), do: 40 - time_in_oven

  @spec preparation_time_in_minutes(integer) :: integer
  def preparation_time_in_minutes(layer_number), do: layer_number * 2

  @spec total_time_in_minutes(integer, integer) :: integer
  def total_time_in_minutes(layer_number, time_in_oven),
    do: preparation_time_in_minutes(layer_number) + time_in_oven

  def alarm(), do: "Ding!"
end
