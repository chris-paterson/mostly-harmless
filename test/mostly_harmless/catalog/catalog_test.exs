defmodule MostlyHarmless.CatalogTest do
  use ExUnit.Case
  alias MostlyHarmless.Catalog
  alias MostlyHarmless.Catalog.Product

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
end