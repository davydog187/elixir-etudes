defmodule Stats do
  @doc """
  minimum/1, which takes a list of numbers as its argument and returns the smallest value.
  """
  def minimum(list) do
    [h|_] = list
    minimum(list, h)
  end

  defp minimum([], a) do
    a
  end

  defp minimum([h|tail], a) do
    lesser = cond do
      h < a -> h
      True -> a
    end
    minimum(tail, lesser)
  end

  @doc """
  maximum/1, which takes a list of numbers as its argument and returns the largest value.
  """
  def maximum(list) do
    [h|_] = list
    maximum(list, h)
  end

  defp maximum([], a) do
    a
  end

  defp maximum([h|tail], a) do
    greater = cond do
      h > a -> h
      True -> a
    end
    maximum(tail, greater)
  end

  @doc """
  range/1, which takes a list of numbers as its argument and returns a list containing the maximum and minimum values in the list.
  """
  def range(list) do
    [maximum(list), minimum(list)]
  end
end
