defmodule Dijkstra do
  def gcd(n, m) do
    cond do
      m == n -> n
      m > n -> gcd(m-n, n)
      true -> gcd(m, n-m)
    end
  end

  def gcd2(n, m) when m == n do
    n
  end

  def gcd2(n, m) when m > n do
    gcd2(m - n, n)
  end

  def gcd2(n, m) do
    gcd2(m, n - m)
  end

end
