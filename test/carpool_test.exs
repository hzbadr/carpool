defmodule CarpoolTest do
  use ExUnit.Case

  test "return matched coordinates" do
    match_count = Carpool.matched_boxes
    |> Enum.count

    assert match_count > 0
  end
end
