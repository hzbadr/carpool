
defmodule Carpool.Loader.Coordinates do
  alias Carpool.Loader.Csv, as: CsvLoader
  alias Carpool.Geographic.Coordinate
  
  @coordinates_path "data/coordinates.csv"
  
  def load(path \\ @coordinates_path) do
    path
    |> CsvLoader.load
    |> Enum.map(&create_coordinate/1)
  end

  defp create_coordinate({:ok, %{"lat" => lat, "lon" => lon}}) do
    %Coordinate{lat: lat, lon: lon}
  end
end