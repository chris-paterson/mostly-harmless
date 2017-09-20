defmodule MostlyHarmlessWeb.Acceptance.SessionTest do
  use MostlyHarmless.DataCase
  use Hound.Helpers

  hound_session()

  setup do
    alias MostlyHarmless.CRM

    valid_attrs = %{
      "name" => "Arthur",
      "email" => "arthur@earth.com",
      "password" => "hunter2",
      "residence_planet" => "Earth",
      "phone" => "123456789"
    }
    {:ok, _} = CRM.create_customer(valid_attrs)
    :ok
  end

  test "successful login for valid credentials" do
    navigate_to("/login")

    form = find_element(:id, "session-form")
    find_within_element(form, :name, "session[email]")
    |> fill_field("arthur@earth.com")

    find_within_element(form, :name, "session[password]")
    |> fill_field("hunter2")

    find_within_element(form, :tag, "button")
    |> click

    assert current_path() == "/"
    message = find_element(:class, "alert-info") |> visible_text()

    assert message == "Login successful"
  end

  test "show error message for invalid login credentials" do
    navigate_to("/login")

    form = find_element(:id, "session-form")

    find_within_element(form, :tag, "button")
    |> click

    assert current_path() == "/login"
    message = find_element(:class, "alert-danger") |> visible_text()
    assert message == "Invalid username/password combination"
  end
end