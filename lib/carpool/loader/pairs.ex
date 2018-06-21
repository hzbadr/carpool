
defmodule Carpool.Loader.Pairs do
  alias Carpool.Loader.Csv, as: CsvLoader 
  alias Carpool.Geographic.Box
  
  @pairs_path "data/pairs.csv"
  
  def load(path \\ @pairs_path) do
    path
    |> CsvLoader.load
    |> Enum.to_list
    |> create_boxes
  end

  def create_boxes([_]) do
    []
  end

  def create_boxes([ h | t]) do
    {:ok, %{"lat" => lat1, "lon" => lon1}} = h
    [{:ok, %{"lat" => lat2, "lon" => lon2}} | _] = t
    
    [%Box{lat1: lat1, lon1: lon1, lat2: lat2, lon2: lon2} | create_boxes(t)]
  end
end