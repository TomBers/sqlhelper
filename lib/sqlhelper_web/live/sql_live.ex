defmodule SqlhelperWeb.SqlLive do
  use Phoenix.LiveView
  use SqlhelperWeb, :html

  import SqlhelperWeb.Table
  alias Sqlhelper.Tables.Killer

  @joiner_char "__"

  def mount(%{"challenge_id" => id}, _session, socket) do
    q = Enum.random(["SELECT * FROM suspects"])

    challenge = Sqlhelper.Challenges.get_challenge!(id)
    killer = Sqlhelper.Challenges.get_killer!(id)
    # TODO - get the suspects associated with the challenge / crime
    suspects = Sqlhelper.Challenges.get_suspects!()

    {:ok,
     assign(socket,
       query: q,
       result: [],
       columns: [],
       error: nil,
       challenge: challenge,
       killer: killer.killer,
       suspects: suspects,
       guess: "",
       answer: "",
       query_history: [],
       saved_results: [],
       draw_open: true
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
        {:noreply, assign(socket, query: query, error: error, query_history: query_history)}
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

  def handle_event("submit_answer", %{"suspects" => suspect_id}, socket) do
    IO.inspect(suspect_id, label: "suspect_id")
    Killer.check_answer(suspect_id, socket.assigns.killer)

    {:noreply, socket}
  end

  defp split_res(res) do
    String.split(res, @joiner_char)
  end
end
