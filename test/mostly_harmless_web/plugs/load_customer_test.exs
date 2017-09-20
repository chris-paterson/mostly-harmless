defmodule MostlyHarmlessWeb.Plugs.LoadCustomerTest do
  use MostlyHarmlessWeb.ConnCase
  alias MostlyHarmless.CRM

  @valid_attrs %{
    "name" => "Arthur",
    "email" => "arthur@earth.com",
    "password" => "hunter2",
    "residence_planet" => "Earth",
    "phone" => "123456789"
  }

  test "fetch customer from session on subsequent visit" do
    {:ok, customer} = CRM.create_customer(@valid_attrs)

    # Build a new conn by posting login data to /login path.
    conn = post build_conn(), "/login", %{"session" => @valid_attrs}

    # Reuse the same conn instead of building a new one.
    conn = get conn, "/"

    assert customer.id == conn.assigns.current_customer.id
  end
end