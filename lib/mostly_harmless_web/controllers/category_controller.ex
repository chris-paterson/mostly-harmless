defmodule MostlyHarmlessWeb.CategoryController do
  use MostlyHarmlessWeb, :controller
  alias MostlyHarmless.Catalog

  def show(conn, %{"name" => name}) do
    products = Catalog.get_category_products(name)

    conn
    |> assign(:products, products)
    |> assign(:name, name)
    |> render("show.html")
  end
end