defmodule SqlhelperWeb.TaskList do
  use Phoenix.Component

  def task_list(assigns) do
    ~H"""
    <div tabindex="0" class="collapse collapse-arrow border border-base-300 bg-base-200">
      <div class="collapse-title text-xl font-medium">
        Task List
      </div>
      <div class="collapse-content">
        <ol class="list-decimal ml-6">
          <%= for task <- @tasks do %>
            <div class="tooltip" data-tip={task.hint}>
              <li onclick="window.taskListToggle(this)" class="task-list-task txt-base-400">
                <%= task.instruction %>
              </li>
            </div>
            <br />
          <% end %>
        </ol>
      </div>
    </div>
    """
  end
end
