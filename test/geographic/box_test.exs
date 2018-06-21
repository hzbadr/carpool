defmodule Geographic.BoxTest do
  use ExUnit.Case
  setup do
    box = %Carpool.Geographic.Box{lat1: 1, lon1: 2, lat2: 3, lon2: 4}
    {:ok, [box: box]}
  end
  
  test "has lat1, lon1, lat2, lon2 and coordinate attributes", %{box: box} do
    assert box.lat1 == 1
    assert box.lon1 == 2
    assert box.lat2 == 3
    assert box.lon2 == 4
    assert box.coordinate == nil
  end
  
  test "update coordinate successfully", %{box: box} do
    coord = %Carpool.Geographic.Coordinate{lat: 1, lon: 2}
    box = Carpool.Geographic.Box.update_coordinate(box, coord)
    assert box.coordinate == coord
  end
  
  test "update coordinate with nil", %{box: box} do
    box = Carpool.Geographic.Box.update_coordinate(box, nil)
    assert box.coordinate == nil
  end
  
  test "update coordinate for nil box" do
    box = Carpool.Geographic.Box.update_coordinate(nil, nil)
    assert box == nil
  end
  
  test "return true for matched coordinate", %{box: box} do
    coord = %Carpool.Geographic.Coordinate{lat: 1, lon: 2}
    assert Carpool.Geographic.Box.matched_coordinate?(box, coord) == true
    coord = %Carpool.Geographic.Coordinate{lat: 1.5, lon: 2.5}
    assert Carpool.Geographic.Box.matched_coordinate?(box, coord) == true
    coord = %Carpool.Geographic.Coordinate{lat: 1, lon: 4}
    assert Carpool.Geographic.Box.matched_coordinate?(box, coord) == true
  end
  
  test "return false for unmatched coordinate", %{box: box} do
    coord = %Carpool.Geographic.Coordinate{lat: 3, lon: 5}
    assert Carpool.Geographic.Box.matched_coordinate?(box, coord) == false
    coord = %Carpool.Geographic.Coordinate{lat: 3.1, lon: 3}
    assert Carpool.Geographic.Box.matched_coordinate?(box, coord) == false
    coord = %Carpool.Geographic.Coordinate{lat: 1.1, lon: 4.1}
    assert Carpool.Geographic.Box.matched_coordinate?(box, coord) == false
  end
  
  test "return true for same boxes", %{box: box} do
    assert Carpool.Geographic.Box.same_box?(box, box) == true
  end
  
  test "return true for different boxed", %{box: box} do
    box2 = %Carpool.Geographic.Box{lat1: 1, lon1: 2, lat2: 3, lon2: 5}
    assert Carpool.Geographic.Box.same_box?(box, box2) == false
    assert Carpool.Geographic.Box.same_box?(box, nil) == false
    assert Carpool.Geographic.Box.same_box?(nil, box2) == false
  end
  
  test "create a box for coordinates" do
    coord1 = %Carpool.Geographic.Coordinate{lat: 1, lon: 2}
    coord2 = %Carpool.Geographic.Coordinate{lat: 3, lon: 4}
    box = Carpool.Geographic.Box.box_from_coordinates(coord1, coord2)
    assert box.lat1 == 1
    assert box.lon1 == 2
    assert box.lat2 == 3
    assert box.lon2 == 4
  end
end
