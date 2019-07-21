defmodule DispatcherWeb.ProgressChannel do
  use DispatcherWeb, :channel

  def join("progress:" <> id, _params, socket) do
    with socket <- socket |> assign(:id, id) do
      {:ok, socket}
    end
  end

  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end
end
