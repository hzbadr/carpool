defmodule Geographic.CoordinateTest do
  use ExUnit.Case

  test "has lat and lon attributes" do
    box = %Carpool.Geographic.Coordinate{lat: 1, lon: 2}
    assert box.lat == 1
    assert box.lon == 2
  end
end
