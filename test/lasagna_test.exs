defmodule LasagnaTests do
  use ExUnit.Case
  doctest Lasagna

  test "time in oven should be 40" do
    assert Lasagna.expected_minutes_in_oven() === 40
  end

  test "time remaining should be 40 - argument passed" do
    assert Lasagna.remaining_minutes_in_oven(25) === 15
  end

  test "preparation time for one layer" do
    assert Lasagna.preparation_time_in_minutes(1) === 2
  end

  test "preparation time for multiple layers" do
    assert Lasagna.preparation_time_in_minutes(3) === 6
  end

  test "total preparation time for one layer" do
    assert Lasagna.total_time_in_minutes(1, 30) === 12
  end

  test "total preparation time for multiple layers" do
    assert Lasagna.total_time_in_minutes(4, 8) === 40
  end

  test "total preparation time should be the time per layer plus time in oven" do
    assert Lasagna.total_time_in_minutes(1, 30) === 12
  end

  test "alarm rings" do
    assert Lasagna.alarm() === "Ding!"
  end
end
