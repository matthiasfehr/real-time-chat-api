defmodule RealTimeChatWeb.PageController do
  use RealTimeChatWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
