
defmodule PhoenixHotwire.Repo.Todo do

  @moduledoc false
  use PhoenixHotwire.DataCase, async: true

  describe "todos" do
    
    alias PhoenixHotwire.Repo.Todo
    
    alias PhoenixHotwire.Schemas.Todo, as: TodoSchema

    @valid_attrs %{title: "some title"}
    @update_attrs %{title: "some updated title"}
    @invalid_attrs %{title: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Todo.create()

      todo
    end

    test "list/0 returns all todos" do
      todo = todo_fixture()
      assert Todo.list() == [todo]
    end

    test "get!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Todo.get!(todo.id) == todo
    end

    test "create/1 with valid data creates a todo" do
      assert {:ok, %TodoSchema{} = todo} = Todo.create(@valid_attrs)
      assert todo.title == "some title"
    end

    test "create/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Todo.create(@invalid_attrs)
    end

    test "update/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, %TodoSchema{} = todo} = Todo.update(todo, @update_attrs)
      assert todo.title == "some updated title"
    end

    test "update/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todo.update(todo, @invalid_attrs)
      assert todo == Todo.get!(todo.id)
    end

    test "delete/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %TodoSchema{}} = Todo.delete(todo)
      assert_raise Ecto.NoResultsError, fn -> Todo.get!(todo.id) end
    end

    test "edit_changeset/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Todo.edit_changeset(todo)
    end

    test "new_changeset/1 returns a todo changeset" do
      assert %Ecto.Changeset{} = Todo.new_changeset
    end
  end
end
