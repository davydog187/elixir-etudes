defmodule AskArea do

  def area do
    input = IO.gets("Please enter the shape (R)ectangle, (T)riangle, (E)llipse: ")
      |> String.first
    shape = char_to_shape(input)
    {d1, d2} = case shape do
      :rectangle -> get_dimensions("length", "width")
      :triangle -> get_dimensions("base", "height")
      :ellipse -> get_dimensions("radius1", "radius2")
      :unknown -> { 0, 0 }
    end
    calculate shape, d1, d2
  end

  defp char_to_shape(char) do
    case String.upcase(char) do
      "R" -> :rectangle
      "T" -> :triangle
      "E" -> :ellipse
      _   -> :unknown
    end
  end

  def get_number(prompt) do
    { number, _ } = IO.gets("Enter #{prompt} > ")
                    |> String.strip
                    |> Integer.parse
    number
  end

  defp get_dimensions(prompt1, prompt2) do
    number1 = get_number prompt1
    number2 = get_number prompt2
    { number1, number2 }
  end

  defp calculate(_shape, dimension1, dimension2) when dimension1 < 0 or dimension2 < 0 do
    IO.puts "The dimensions entered were negative"
  end

  defp calculate(:unknown, _, _) do
    IO.puts "An unknown shape was entered"
  end

  defp calculate(shape, dimension1, dimension2) do
    Geom.area(shape, dimension1, dimension2)
  end
end
