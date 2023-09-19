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

  def handle_event("save_result", %{"row" => row, "col" => col}, socket) do
    # Add the row to the saved results
    IO.inspect(col, label: "col")
    saved_results = [row | socket.assigns.saved_results]

    {:noreply, assign(socket, saved_results: saved_results)}
  end

  def handle_event("guess", %{"guess" => guess}, socket) do
    answer = if guess == socket.assigns.challenge.answer, do: "Correct!", else: "Incorrect."
    {:noreply, assign(socket, answer: answer)}
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
  end

  defp is_val_date_time?(%DateTime{}), do: true
  defp is_val_date_time?(_), do: false
end
