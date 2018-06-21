defmodule Carpool.Server.Matcher do
  use Agent

  alias Carpool.Matcher.Coordinate, as: CoordinateMatcher
  alias Carpool.Geographic.Box

  def start_link([]) do
    Agent.start_link(fn -> CoordinateMatcher.match end, name: __MODULE__)
  end

  def get_boxes do
    Agent.get(__MODULE__, fn state -> state end)
  end

  def match_coordinates(coord1, coord2) do
    [match(coord1), match(coord2)]
  end

  def add_box(coord1, coord2) do
    box = Box.box_from_coordinates(coord1, coord2)
    Agent.update(__MODULE__, fn state -> [ box | state ] end)
  end

  def update_box(current, new) do
    Agent.update(__MODULE__, fn state -> 
      state |> Enum.map(fn box -> 
        if Box.same_box?(box, current) do
          new
        else
          box
        end
      end) 
    end)
  end

  defp match(coord) do
    boxes = __MODULE__.get_boxes
    current_box = Enum.find(boxes, fn box ->
      Box.matched_coordinate?(box, coord)
    end)

    new_box = Box.update_coordinate(current_box, coord)
    __MODULE__.update_box(current_box, new_box)
    new_box
  end
end