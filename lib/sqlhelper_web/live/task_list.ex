defmodule SqlhelperWeb.TaskList do
  use Phoenix.Component

  def task_list(assigns) do
    ~H"""
    <ol class="list-decimal">
      <%= for task <- @tasks do %>
        <li><%= task.instruction %></li>
      <% end %>
    </ol>
    """
  end
end
