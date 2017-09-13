defmodule MostlyHarmlessWeb.PageController do
  use MostlyHarmlessWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
