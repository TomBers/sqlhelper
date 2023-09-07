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
       answer: ""
     )}
  end

  def handle_event("execute", %{"query" => query}, socket) do
    IO.inspect(Sqlhelper.Repo.query(query))

    case Sqlhelper.Repo.query(query) do
      {:ok, %{columns: cols, rows: rows}} ->
        {:noreply, assign(socket, query: query, columns: cols, result: rows, error: nil)}

      {:error, %{postgres: %{message: error}}} ->
        {:noreply, assign(socket, error: error)}
    end
  end

  def handle_event("guess", %{"guess" => guess}, socket) do
    answer = if guess == socket.assigns.challenge.answer, do: "Correct!", else: "Incorrect."
    {:noreply, assign(socket, answer: answer)}
  end
end
