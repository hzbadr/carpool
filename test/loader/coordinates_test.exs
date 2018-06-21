defmodule Loader.CoordinatesTest do
  use ExUnit.Case

  test "loads files succefully" do
    rows_count = Carpool.Loader.Coordinates.load
    |> Enum.count

    assert rows_count > 0
  end
end