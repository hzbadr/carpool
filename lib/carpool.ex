defmodule Carpool do
  use Application

  def start(_type, _args) do
    Carpool.Server.Matcher.start_link([])
  end

  def match(coord1, coord2) do
    Carpool.Server.Matcher.add_box(coord1, coord2)
  end

  def boxes do
    Carpool.Server.Matcher.get_boxes
  end
  
  def matched_boxes do
    Carpool.boxes
    |> Enum.filter(fn box -> box.coordinate != nil end)
  end
end
