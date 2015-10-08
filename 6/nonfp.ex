defmodule NonFP do

  def generate_pockets(missing_list, good_probability) do
    :random.seed(:erlang.now)
    generate_pockets(missing_list, good_probability, [])
  end

  def generate_pockets([], _, teeth) do
    Enum.reverse(teeth)
  end

  def generate_pockets([h|tail], probability, teeth) do
    tooth = case h do
      ?F -> [0]
      ?T -> generate_tooth(probability)
    end
    generate_pockets(tail, probability, [tooth|teeth])
  end

  defp generate_tooth(good_tooth) do
    is_a_bad_tooth = :random.uniform
    base_depth = cond do
      is_a_bad_tooth < good_tooth -> 2
      _ -> 3
    end
    generate_tooth(base_depth, 6, [])
  end

  defp generate_tooth(_, 0, pockets) do
    pockets
  end

  defp generate_tooth(base_depth, num_left, pockets) do
    depth = base_depth + :random.uniform(3) - 2
    generate_tooth(base_depth, num_left-1, [depth|pockets])
  end

end
