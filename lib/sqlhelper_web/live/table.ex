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

  attr :allow_save, :boolean, default: false

  def sql_table(assigns) do
    ~H"""
    <table class="table-auto">
      <thead>
        <tr>
          <%= for col <- @columns do %>
            <th><%= col %></th>
          <% end %>
          <%= if @allow_save do %>
            <th>Save</th>
          <% end %>
        </tr>
      </thead>
      <tbody>
        <%= for row <- @rows do %>
          <tr>
            <%= for value <- row do %>
              <%= if is_image(value) do %>
                <td><img src={value} class="w-40 h-auto" /></td>
              <% else %>
                <td><%= value %></td>
              <% end %>
            <% end %>
            <%= if @allow_save do %>
              <td>
                <button
                  phx-click="save_result"
                  phx-value-row={format_query_result(row)}
                  phx-value-col={format_columns(@columns)}
                  class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded"
                >
                  Save
                </button>
              </td>
            <% end %>
          </tr>
        <% end %>
      </tbody>
    </table>
    """
  end
end
