defmodule SqlhelperWeb.SqlLive do
  use Phoenix.LiveView
  use SqlhelperWeb, :html

  import SqlhelperWeb.Table
  import SqlhelperWeb.ViewData
  alias Sqlhelper.Tables.Killer

  @joiner_char "__"

  def mount(_params, _session, socket) do
    # q = Enum.random(["SELECT * FROM suspects"])
    q = ""
    # TODO - hard coded for the time being
    challenge_id = 1
    challenge = Sqlhelper.Challenges.get_challenge!(challenge_id)
    # TODO - get crime_id from challenge
    killer = Sqlhelper.Challenges.get_killer!(challenge_id)
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
       saved_results: []
     )}
  end

  def handle_event("execute", %{"query" => ""}, socket) do
    {:noreply, socket}
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
    res = {col, row}
    saved_results = socket.assigns.saved_results ++ [res]

    {:noreply, assign(socket, saved_results: saved_results)}
  end

  def handle_event("delete_result", %{"row" => row, "col" => col}, socket) do
    {:noreply,
     assign(socket,
       saved_results: socket.assigns.saved_results |> Enum.filter(&(&1 != {col, row}))
     )}
  end

  def handle_event("submit_answer", %{"suspects" => suspect_id}, socket) do
    suspect = socket.assigns.suspects |> Enum.find(&(&1.id == String.to_integer(suspect_id)))

    {:noreply,
     push_event(
       socket,
       "user_has_guessed",
       %{is_correct: Killer.check_answer(suspect_id, socket.assigns.killer), name: suspect.name}
     )}
  end

  defp split_res(res) do
    String.split(res, @joiner_char)
  end
end
