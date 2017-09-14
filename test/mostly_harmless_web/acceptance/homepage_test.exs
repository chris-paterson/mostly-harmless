defmodule MostlyHarmlessWeb.Acceptance.HomepageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

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