defmodule SqlhelperWeb.QueriesController do
  use SqlhelperWeb, :controller
  import Ecto.Query, warn: false
  alias Sqlhelper.Repo

  def index(conn, _params) do
    queries = Repo.all(Sqlhelper.Tables.Queries)
    render(conn, :index, layout: false, queries: queries)
  end
end
