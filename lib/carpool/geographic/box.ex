defmodule Carpool.Geographic.Box do
  defstruct lat1: 0, lon1: 0, lat2: 0, lon2: 0, coordinate: nil

  alias Carpool.Geographic.Coordinate

  def update_coordinate(nil, _), do: nil
  def update_coordinate(box, nil), do: box
  def update_coordinate(box, coordinate), do: %{box | coordinate: coordinate}

  def matched_coordinate?(box, coordinate=%Coordinate{}) do
    matched_lat?(box, coordinate) && matched_lon?(box, coordinate)
  end

  def box_from_coordinates(coord1, coord2) do
    %__MODULE__{lat1: coord1.lat, lon1: coord1.lon, lat2: coord2.lat, lon2: coord2.lon}
  end

  def same_box?(_, nil), do: false
  def same_box?(nil, _), do: false
  def same_box?(box1, box2) do
    box1.lat1 == box2.lat1 &&  box1.lon1 == box2.lon1 &&
      box1.lat2 == box2.lat2 && box1.lon2 == box2.lon2
  end

  defp matched_lat?(box, coordinate) do
    matched?([box.lat1, box.lat2], coordinate.lat)
  end
  
  defp matched_lon?(box, coordinate) do
    matched?([box.lon1, box.lon2], coordinate.lon)
  end

  defp matched?(ps, p) do
    p <= Enum.max(ps) && p >= Enum.min(ps)
  end
end