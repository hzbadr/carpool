defmodule Loader.PairsTest do
  use ExUnit.Case

  test "loads files succefully" do
    rows_count = Carpool.Loader.Pairs.load
    |> Enum.count

    assert rows_count > 0
  end
end