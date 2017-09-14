defmodule MostlyHarmlessWeb.Acceptance.HomepageTest do
  use MostlyHarmless.DataCase
  use Hound.Helpers

  hound_session()

  setup do
    # GIVEN
    # There are two products, Tea and Portal Gun priced 100 and 5000
    # categorized under `consumables` and `gadgets` respectively.
    alias MostlyHarmless.Repo
    alias MostlyHarmless.Catalog.Product

    Repo.insert %Product{name: "Tea", price: 100, sku: "A137", is_seasonal: true, category: "consumables"}
    Repo.insert %Product{name: "Portal Gun", price: 5000, sku: "C137", is_seasonal: false, category: "gadgets"}
    :ok
  end

  test "presence of featured products" do
    # GIVEN
    # There are two products, tea and Portal Gun, priced at λ100 and λ5000 respectively.
    # With tea being the only seasonal product.

    # WHEN
    # I navigate to the home page.
    navigate_to("/")

    # THEN
    # I expect the page title to be "Seasonal Products".
    assert page_source() =~ "Seasonal Products"

    # And I expect tea to be in the products displayed.
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |>  visible_text
    product_price = find_within_element(product, :css, ".product-price") |> visible_text

    assert product_name == "Tea"
    assert product_price == "100"

    # And I expect Portal Gun not to be present.
    refute page_source() =~ "Portal Gun"
  end
end