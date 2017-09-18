defmodule MostlyHarmlessWeb.RegistrationController do
  use MostlyHarmlessWeb, :controller

  def new(conn, _) do
    render(conn, "new.html")
  end
end