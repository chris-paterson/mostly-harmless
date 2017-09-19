defmodule MostlyHarmlessWeb.RegistrationController do
  use MostlyHarmlessWeb, :controller
  alias MostlyHarmless.CRM

  def new(conn, _) do
    changeset = CRM.build_customer()
    residence_planets = Galaxy.ResidenceService.list_planets
    render(conn, "new.html", changeset: changeset, residence_planets: residence_planets)
  end

  def create(conn, %{"registration" => registration_data}) do
    case CRM.create_customer(registration_data) do
      {:ok, _customer} ->
        conn
        |> put_flash(:info, "Registration successful")
        |> redirect(to: page_path(conn, :index))
      {:error, changeset} ->
        residence_planets = Galaxy.ResidenceService.list_planets
        conn
        |> render(:new, changeset: changeset, residence_planets: residence_planets)
    end
  end
end