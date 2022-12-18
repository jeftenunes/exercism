defmodule Rules do
  def eat_ghost?(has_power_pellet, touches_a_ghost),
    do: has_power_pellet and touches_a_ghost

  def score?(touches_a_power_pellet, touches_a_dot),
    do: touches_a_power_pellet or touches_a_dot

  def lose?(has_power_pellet, touches_a_ghost),
    do: not has_power_pellet and touches_a_ghost

  def win?(eaten_all_dots, has_power_pellet, touches_a_ghost),
    do: eaten_all_dots and not lose?(has_power_pellet, touches_a_ghost)
end
