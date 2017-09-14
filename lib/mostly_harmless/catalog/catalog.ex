defmodule MostlyHarmless.Catalog do
  alias MostlyHarmless.Catalog.Product
  alias MostlyHarmless.Repo

  def list_products do
    Product
    |> Repo.all
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