defmodule TodoApp.Todos.Task do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2, where: 2]
  alias TodoApp.Accounts .User

  @derive {Jason.Encoder, only: [:description, :id]}
  schema "tasks" do
    belongs_to :user, User
    field :description, :string
    field :done, :boolean, default: false
    field :expiration, :naive_datetime
    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:description, :done, :expiration, :user_id])
    |> validate_required([:description, :done, :user_id])
    |> validate_length(:description, min: 5)
    |> foreign_key_constraint(:user_id)
  end

  def query_for_tasks(done) do
    from t in TodoApp.Todos.Task, where: t.done == ^done
  end

  def another_query_for_tasks(done) do
    __MODULE__
    |> where(done: ^done)
  end

  def tasks_by_user(user_id) do
    from t in __MODULE__,
      where: t.user_id == ^user_id,
      order_by: [asc: t.inserted_at],
      limit: 10
  end

end
