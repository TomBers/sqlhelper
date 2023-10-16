defmodule SqlhelperWeb.ViewData do
  use Phoenix.Component

  attr :columns, :list, default: []
  attr :row, :list, default: []
  attr :btn_title, :string, default: "View"

  def view_data(assigns) do
    ~H"""
    <button class="btn" onclick={"#{@id}.showModal()"}><%= @btn_title %></button>
    <dialog id={"#{@id}"} class="modal">
      <div class="modal-box">
        <form method="dialog">
          <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
            ✕
          </button>
        </form>
        <div class="overflow-x-auto">
          <table class="table">
            <!-- head -->
            <thead>
              <tr>
                <th></th>
                <th>Label</th>
                <th>Value</th>
              </tr>
            </thead>
            <tbody>
              <%= for {_, cnt} <- Enum.with_index(@row) do %>
                <tr>
                  <td><%= cnt + 1 %></td>
                  <td><%= Enum.at(@columns, cnt) %></td>
                  <td>
                    <p><%= Enum.at(@row, cnt) %></p>
                  </td>
                </tr>
              <% end %>
            </tbody>
          </table>
        </div>
      </div>
    </dialog>
    """
  end
end
