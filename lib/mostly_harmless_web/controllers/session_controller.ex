defmodule MostlyHarmlessWeb.SessionController do
  use MostlyHarmlessWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end