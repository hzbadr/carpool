defmodule CarpoolTest do
  use ExUnit.Case
  doctest Carpool

  test "greets the world" do
    assert Carpool.hello() == :world
  end
end
