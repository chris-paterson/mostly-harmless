defmodule MostlyHarmless.Catalog do
  alias MostlyHarmless.Catalog.Product

  def list_products do
    p1 = %Product{name: "Tea", price: 100, is_seasonal: true, category: "consumables"}
    p2 = %Product{name: "Portal Gun", price: 5000, is_seasonal: false, category: "gadgets"}
    [p1, p2]
  end

  def list_seasonal_products do
    list_products()
    |> Enum.filter(fn(product) -> product.is_seasonal == true end)
  end

  def get_category_products(name) do
    list_products()
    |> Enum.filter(fn(product) -> product.category == name end)
  end
end