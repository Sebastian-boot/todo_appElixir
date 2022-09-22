defmodule TodoApp.Todos.TaskList do
  use Ecto.Schema
  import Ecto.Changeset
  alias TodoApp.Todos.List
  alias TodoApp.Todos.Task

  schema "tasks_lists" do
    belongs_to :task, Task
    belongs_to :list, List
    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:task_id, :list_id])
    |> IO.inspect()
  end

end
