defmodule TodoApp.Todos.List do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  alias TodoApp.Accounts.User
  alias TodoApp.Todos.TaskList

  schema "lists" do
    field :name, :string
    field :tags, {:array, :string}
    belongs_to :user, User

    has_many :collaborators, User

    many_to_many :tasks, TodoApp.Todos.Task, join_through: TaskList

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:name, :tags, :user_id])
    |> cast_assoc(:collaborators)
    |> validate_required([:name, :tags, :user_id])
  end

  def lists_by_user(user_id) do
    from t in __MODULE__,
      where: t.user_id == ^user_id,
      order_by: [asc: t.inserted_at],
      limit: 5
  end

end
