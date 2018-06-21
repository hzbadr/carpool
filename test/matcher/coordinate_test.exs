defmodule Matcher.CoordinateTest do
  use ExUnit.Case

  # this test is fragile and slow!
  test "it match coordinates with boxes" do
    match_count = Carpool.Matcher.Coordinate.match
    |> Enum.filter(fn box -> box.coordinate != nil end)
    |> Enum.count
    
    assert match_count > 0
  end
end
