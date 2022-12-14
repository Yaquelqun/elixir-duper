defmodule Duper.WorkerSupervisor do
  use DynamicSupervisor

  @me WorkerSupervisor

  def start_link(_) do
    DynamicSupervisor.start_link(__MODULE__, :noargs, name: @me)
  end

  def init(:noargs) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def add_worker() do
    {:ok, pid} = DynamicSupervisor.start_child(@me, Duper.Worker)
  end
end
