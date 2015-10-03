defmodule Geom do
  @moduledoc """
  Geom module for geometry thangs
  """
  @doc """
  computes the area for a given `x` and `y`
  """
  def area(x \\ 1, y \\ 1) do
    x * y
  end
end

IO.puts Geom.area(4, 5)
IO.puts Geom.area(11, 5)
IO.puts Geom.area(7, 9)
IO.puts Geom.area(7)
IO.puts Geom.area()
