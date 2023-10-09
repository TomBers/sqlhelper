defmodule SqlhelperWeb.Table do
  use Phoenix.Component

  @joiner_char "__"

  def is_image(val) do
    is_bitstring(val) && String.starts_with?(val, "/images/")
  end

  def format_columns(cols) do
    # IO.inspect(cols, label: "cols")
    Enum.join(cols, @joiner_char)
  end

  def format_query_result(result) do
    Enum.map(result, fn elem ->
      case elem do
        _ when is_boolean(elem) ->
          if elem, do: "true", else: "false"

        _ ->
          if is_val_date_time?(elem), do: DateTime.to_string(elem), else: to_string(elem)
      end
    end)
    |> Enum.join(@joiner_char)
  end

  defp is_val_date_time?(%DateTime{}), do: true
  defp is_val_date_time?(_), do: false

  attr :columns, :list, default: []
  attr :rows, :list, default: []
  attr :title, :string, default: "Table"
  attr :id_label, :string, default: "view"
  attr :allow_save, :boolean, default: false
  attr :allow_delete, :boolean, default: false

  def sql_table(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 overflow-x-auto">
      <h1 class="text-lg"><%= @title %></h1>
      <table class="min-w-full divide-y divide-gray-200 border-solid">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
              View
            </th>
            <%= if @allow_save do %>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Save
              </th>
            <% end %>
            <%= if @allow_delete do %>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Delete
              </th>
            <% end %>
            <%= for col <- @columns do %>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                <%= col %>
              </th>
            <% end %>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <%= for {row, cnt} <- Enum.with_index(@rows) do %>
            <tr class="hover:bg-gray-100 odd:bg-white even:bg-gray-50">
              <td class="px-6 py-4 whitespace-nowrap">
                <button class="btn" onclick={"#{@id_label}_#{cnt}.showModal()"}>View</button>
                <dialog id={"#{@id_label}_#{cnt}"} class="modal">
                  <div class="modal-box">
                    <form method="dialog">
                      <button class="btn btn-sm btn-circle btn-ghost absolute right-2 top-2">
                        ✕
                      </button>
                    </form>
                    <h3 class="font-bold text-lg">
                      <%= for {_, cnt} <- Enum.with_index(row) do %>
                        <%= Enum.at(@columns, cnt) %> : <%= IO.inspect(Enum.at(row, cnt)) %>
                        <br />
                      <% end %>
                    </h3>
                  </div>
                </dialog>
              </td>
              <%= if @allow_save do %>
                <td class="px-6 py-4 whitespace-nowrap">
                  <button
                    phx-click="save_result"
                    phx-value-row={format_query_result(row)}
                    phx-value-col={format_columns(@columns)}
                    class="btn"
                  >
                    Save
                  </button>
                </td>
              <% end %>
              <%= if @allow_delete do %>
                <td class="px-6 py-4 whitespace-nowrap">
                  <button
                    phx-click="delete_result"
                    phx-value-row={format_query_result(row)}
                    phx-value-col={format_columns(@columns)}
                    class="btn"
                    id={format_query_result(row)}
                  >
                    Delete
                  </button>
                </td>
              <% end %>
              <%= for value <- row do %>
                <%= if is_image(value) do %>
                  <td class="px-6 py-4 whitespace-nowrap">
                    <img src={value} alt={value} title={value} class="w-40 h-auto hover:scale-150" />
                  </td>
                <% else %>
                  <td class="px-6 py-4 whitespace-nowrap"><%= value %></td>
                <% end %>
              <% end %>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
end
