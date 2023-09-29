defmodule SqlhelperWeb.TaskList do
  use Phoenix.Component

  def task_list(assigns) do
    ~H"""
    <ol class="list-decimal">
      <%= for task <- @tasks do %>
        <li onclick="window.taskListToggle(this)" class="task-list-task"><%= task.instruction %></li>
      <% end %>
    </ol>
    """
  end
end
