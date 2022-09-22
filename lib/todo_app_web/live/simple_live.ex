defmodule TodoAppWeb.SimpleLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <h1>Hello world!!!</h1>
    <input type="text" name="input" phx-keydown="capture">
    <label for="text">Result:</label>
    <h3><%= @message %></h3>
    """
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, :message, "")
    {:ok, socket}
  end

  def handle_event("capture", %{"key" => _key, "value"  => value}, socket) do
    socket = assign(socket, :message, value)
    {:noreply, socket}
  end

end
