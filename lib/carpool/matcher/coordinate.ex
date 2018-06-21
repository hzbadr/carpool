defmodule Carpool.Matcher.Coordinate do
  alias Carpool.Geographic.Box
  alias Carpool.Loader.Pairs, as: PairsLoader
  alias Carpool.Loader.Coordinates, as: CoordinatesLoader

  def match do
    boxes = PairsLoader.load
    coordinates = CoordinatesLoader.load
    boxes 
    |> Enum.map(fn box ->
      coordinate = find_matched_coordinate(box, coordinates)
      Box.update_coordinate(box, coordinate)
    end)
  end

  defp find_matched_coordinate(box, coordinates) do
    Enum.find(coordinates, fn coordinate ->
      Box.matched_coordinate?(box, coordinate)
    end)
  end
end