defmodule SqlhelperWeb.TaskList do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <ol class="list-decimal ml-6">
      <%= for task <- @tasks do %>
        <li
          class="task-list-task txt-base-400"
          phx-click="complete_task"
          phx-value-instruction={task.instruction}
          phx-target={@myself}
        >
          <%= task.instruction %>
        </li>
        <br />
      <% end %>
    </ol>
    """
  end

  def handle_event("complete_task", %{"instruction" => val}, socket) do
    new_tasks = Enum.filter(socket.assigns.tasks, fn task -> task.instruction != val end)

    {:noreply, assign(socket, tasks: new_tasks)}
  end
end
