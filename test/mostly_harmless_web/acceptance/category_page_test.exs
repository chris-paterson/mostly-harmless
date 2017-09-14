defmodule MostlyHarmlessWeb.Acceptance.CategoryPageTest do
  use ExUnit.Case
  use Hound.Helpers

  hound_session()

  setup do
    # GIVEN
    # There are two products, Tea and Portal Gun priced 100 and 5000
    # categorized under `consumables` and `gadgets` respectively.
    :ok
  end

  test "show consumables" do
    # When I navigate to the consumables page
    navigate_to("/categories/consumables")

    # Then I expect the title page to be "Consumables"
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Consumables"

    # And I expect Tea to be displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Tea"
    assert product_price == "100"

    refute page_source() =~ "Portal Gun"
  end

  test "show gadgets" do
    # When I navigate to the gadgets page
    navigate_to("/categories/gadgets")

    # Then I expect the title page to be "Consumables"
    page_title = find_element(:css, ".page-title") |> visible_text()
    assert page_title == "Gadgets"

    # And I expect Tea to be displayed
    product = find_element(:css, ".product")
    product_name = find_within_element(product, :css, ".product-name") |> visible_text()
    product_price = find_within_element(product, :css, ".product-price") |> visible_text()

    assert product_name == "Portal Gun"
    assert product_price == "5000"

    refute page_source() =~ "Tea"
  end
end