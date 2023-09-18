defmodule Sqlhelper.DataCheckServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_) do
    IO.inspect("DataCheckServer init")
    Sqlhelper.StaticData.run()
    {:ok, %{}}
  end
end
