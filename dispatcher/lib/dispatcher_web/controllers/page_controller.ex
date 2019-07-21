defmodule DispatcherWeb.PageController do
  use DispatcherWeb, :controller

  alias Dispatcher.Broadcaster

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def send(_conn, %{"id" => id}) do
    1..100
    |> Enum.each(fn i ->
      Broadcaster.send_progress_update(id, i)
      :timer.sleep(100)
    end)
  end
end
