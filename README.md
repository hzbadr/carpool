# Carpool

**TODO: Add description**

## Installation
  * clone the repo
  * mix deps.get

## How to Use
  * iex -S mix
  * coord1 = %Carpool.Geographic.Coordinate{lat: 1, lon: 2} # create coordinate
  * coord2 = %Carpool.Geographic.Coordinate{lat: 3, lon: 4} # create coordinate

  * Carpool.boxes  # will return all bounded boxes
  * Carpool.matched_boxes  # will return matched boxes with coordinates
  * Carpool.add_box(coord1, coord2)  # will add a box
  * Carpool.match(coord1, coord2)  # will return a list of two elments with matched box or nil if no match
