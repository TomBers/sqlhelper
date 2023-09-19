defmodule SqlhelperWeb.SqlLive do
  use Phoenix.LiveView

  def mount(%{"challenge_id" => id}, _session, socket) do
    q = ""
    challenge = Sqlhelper.Challenges.get_challenge!(id)

    {:ok,
     assign(socket,
       query: q,
       result: [],
       columns: [],
       error: nil,
       challenge: challenge,
       guess: "",
       answer: "",
       query_history: [],
       saved_results: []
     )}
  end

  def handle_event("execute", %{"query" => query}, socket) do
    query_history = [query | socket.assigns.query_history]

    case Sqlhelper.Repo.query(query) do
      {:ok, %{columns: cols, rows: rows}} ->
        {:noreply,
         assign(socket,
           query: query,
           columns: cols,
           result: rows,
           error: nil,
           query_history: query_history
         )}

      {:error, %{postgres: %{message: error}}} ->
        {:noreply, assign(socket, error: error, query_history: query_history)}
    end
  end

  def handle_event("save_result", %{"row" => row}, socket) do
    # Add the row to the saved results
    saved_results = [row | socket.assigns.saved_results]

    {:noreply, assign(socket, saved_results: saved_results)}
  end

  def handle_event("guess", %{"guess" => guess}, socket) do
    answer = if guess == socket.assigns.challenge.answer, do: "Correct!", else: "Incorrect."
    {:noreply, assign(socket, answer: answer)}
  end

  def filter_row_value(row) do
    row
    |> Enum.map(fn v ->
      if is_boolean(v) do
        map_bool_to_string(v)
      else
        v
      end
    end)
    |> Enum.filter(fn v -> is_integer(v) or is_bitstring(v) end)
    |> IO.inspect()
  end

  defp map_bool_to_string(true), do: "true"
  defp map_bool_to_string(false), do: "false"
end
