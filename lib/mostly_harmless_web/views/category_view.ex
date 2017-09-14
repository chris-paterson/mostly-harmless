defmodule MostlyHarmlessWeb.CategoryView do
  use MostlyHarmlessWeb, :view

  def title_case(name) do
    name
    |> String.downcase
    |> String.capitalize
  end
end