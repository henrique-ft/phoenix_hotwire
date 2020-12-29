defmodule PhoenixHotwireWeb.HomeController do
  use PhoenixHotwireWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

end
