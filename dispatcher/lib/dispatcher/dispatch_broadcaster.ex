defmodule Dispatcher.Broadcaster do
  @moduledoc """
  This module is responsible for broadcasting channel messages for dispatch progress reports.
  """

  alias DispatcherWeb.Endpoint

  def send_progress_update(channel_id, value) do
    Endpoint.broadcast("progress:#{channel_id}", "change", %{
      "value" => value
    })
  end
end
