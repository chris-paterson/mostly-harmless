defmodule MostlyHarmless.CatalogTest do
  use MostlyHarmless.DataCase

  alias MostlyHarmless.{Catalog, Repo}
  alias MostlyHarmless.Catalog.Product

  setup do
    Repo.insert %Product{name: "Tea", price: 100, sku: "A137", is_seasonal: true, category: "consumables"}
    Repo.insert %Product{name: "Portal Gun", price: 5000, sku: "C137", is_seasonal: false, category: "gadgets"}
    :ok
  end

  test "list_products/0 returns all products" do
    [p1, p2] = Catalog.list_products
    
    assert %Product{} = p1
    assert p1.name == "Tea"

    assert %Product{} = p2
    assert p2.name == "Portal Gun"

    # This could also be done using
    # [p1 = %Product{}, p2 = %Product{}] = Catalog.list_products
  end

  test "list_seasonal_product/0 return all seasonal products" do
    [product = %Product{}] = Catalog.list_seasonal_products

    assert product.name == "Tea"
  end

  test "get_category_products/1 returns products of the given category" do
    [product = %Product{}] = Catalog.get_category_products("consumables")

    assert product.name == "Tea"
  end
end