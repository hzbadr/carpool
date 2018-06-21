defmodule Server.MatcherTest do
  use ExUnit.Case

  test "load and store boxes" do
    boxes_count = Carpool.Server.Matcher.get_boxes
    |> Enum.count

    assert boxes_count > 0
  end

  test "add box from two coordinates" do
    old_boxes_count = Carpool.Server.Matcher.get_boxes
    |> Enum.count

    coord1 = %Carpool.Geographic.Coordinate{lat: 1, lon: 2}
    coord2 = %Carpool.Geographic.Coordinate{lat: 1.5, lon: 2.5}
    Carpool.Server.Matcher.add_box(coord1, coord2)

    new_boxes_count = Carpool.Server.Matcher.get_boxes
    |> Enum.count
    
    assert new_boxes_count > old_boxes_count
  end

  test "update existing box" do
    coord = %Carpool.Geographic.Coordinate{lat: 1.5, lon: 2.5}
    box = %Carpool.Geographic.Box{lat1: 1, lon1: 2, lat2: 1.5, lon2: 2.5, coordinate: coord}
    
    coord1 = %Carpool.Geographic.Coordinate{lat: 1, lon: 2}
    coord2 = %Carpool.Geographic.Coordinate{lat: 3, lon: 4}
    Carpool.Server.Matcher.add_box(coord1, coord2)
   
    [current_box] = Carpool.Server.Matcher.get_boxes |> Enum.take(-1)

    Carpool.Server.Matcher.update_box(current_box, box)

    assert Carpool.Server.Matcher.get_boxes |> Enum.take(-1) == [box]
  end
end