
defmodule PhoenixHotwire.Repo.Todo do

  @moduledoc false

  
  alias PhoenixHotwire.Schemas.Todo
  
  alias PhoenixHotwire.Repo

  def list do
    Repo.all(Todo)
  end

  def get!(id), do: Repo.get!(Todo, id)

  def create(attrs \\ %{}) do
    %Todo{}
    |> Todo.changeset(attrs)
    |> Repo.insert()
  end

  def update(%Todo{} = todo, attrs) do
    todo
    |> Todo.changeset(attrs)
    |> Repo.update()
  end

  def delete(%Todo{} = todo) do
    Repo.delete(todo)
  end

  def new_changeset do
    Todo.changeset(%Todo{}, %{})
  end

  def edit_changeset(%Todo{} = todo) do
    Todo.changeset(todo, %{})
  end
end
