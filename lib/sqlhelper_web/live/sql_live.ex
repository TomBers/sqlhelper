defmodule SqlhelperWeb.SqlLive do
  use Phoenix.LiveView
  use SqlhelperWeb, :html

  import SqlhelperWeb.Table

  @joiner_char "__"

  def mount(%{"challenge_id" => id}, _session, socket) do
    q = "select * from suspects join suspects_media on suspects.id = suspects_media.suspect_id"
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
    # IO.inspect(col, label: "col")

    # TODO - match the rows with the columns
    res = {col, row}
    saved_results = [res | socket.assigns.saved_results]

    {:noreply, assign(socket, saved_results: saved_results)}
  end

  def handle_event("delete_result", %{"row" => row, "col" => col}, socket) do
    {:noreply,
     assign(socket,
       saved_results: socket.assigns.saved_results |> Enum.filter(&(&1 != {col, row}))
     )}
  end

  defp split_res(res) do
    String.split(res, @joiner_char)
  end
end
