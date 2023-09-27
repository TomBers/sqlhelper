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
  attr :allow_save, :boolean, default: false
  attr :allow_delete, :boolean, default: false

  def sql_table(assigns) do
    ~H"""
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 overflow-x-auto">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <%= for col <- @columns do %>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                <%= col %>
              </th>
            <% end %>
            <%= if @allow_save do %>
              <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                Save
              </th>
            <% end %>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <%= for row <- @rows do %>
            <tr class="hover:bg-gray-100 odd:bg-white even:bg-gray-50">
              <%= for value <- row do %>
                <%= if is_image(value) do %>
                  <td class="px-6 py-4 whitespace-nowrap"><img src={value} class="w-40 h-auto" /></td>
                <% else %>
                  <td class="px-6 py-4 whitespace-nowrap"><%= value %></td>
                <% end %>
              <% end %>
              <%= if @allow_save do %>
                <td class="px-6 py-4 whitespace-nowrap">
                  <button
                    phx-click="save_result"
                    phx-value-row={format_query_result(row)}
                    phx-value-col={format_columns(@columns)}
                    class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
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
                    class="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500"
                  >
                    Delete
                  </button>
                </td>
              <% end %>
            </tr>
          <% end %>
        </tbody>
      </table>
    </div>
    """
  end
end
