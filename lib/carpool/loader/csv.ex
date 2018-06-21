defmodule Carpool.Loader.Csv do
  def load(path) do
    path
    |> File.stream!
    |> CSV.decode(headers: true)
  end
end