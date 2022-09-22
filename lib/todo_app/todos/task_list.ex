defmodule TodoApp.Todos.TaskList do
  use Ecto.Schema
  alias TodoApp.Todos.List
  alias TodoApp.Todos.Task

  schema "tasks_lists" do
    belongs_to :tasks, Task
    belongs_to :lists, List
    timestamps()
  end

end
