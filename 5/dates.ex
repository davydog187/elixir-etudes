defmodule Dates do
  def date_parts(date) do
    parts = String.split(date, "-")
    Enum.map(parts, fn num -> parse_num(num) end)
  end

  defp parse_num(num) do
    { num, _ } = Integer.parse(num)
    num
  end
end
