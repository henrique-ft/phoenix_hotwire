defmodule PhoenixHotwireWeb.TodoController do
  use PhoenixHotwireWeb, :controller
  alias PhoenixHotwire.Repo.Todo

  def index(conn, _params) do
    render(conn, "index.html", todos: Todo.list)
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: Todo.new_changeset)
  end

  def create(conn, %{"todo" => todo_params}) do
    case Todo.create(todo_params) do
      {:ok, todo} ->
        conn
        |> put_flash(:info, gettext("Todo created successfully."))
        |> redirect(to: Routes.todo_path(conn, :show, todo))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> stream_replace("_message.html", message: "erro")
    end
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", todo: Todo.get!(id))
  end

  def edit(conn, %{"id" => id}) do
    todo = Todo.get!(id)
    changeset = Todo.edit_changeset(todo)
    render(conn, "edit.html", todo: todo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Todo.get!(id)

    case Todo.update(todo, todo_params) do
      {:ok, todo} ->
        conn
        |> put_flash(:info, gettext("Todo updated successfully."))
        |> redirect(to: Routes.todo_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> stream_replace("_message.html", message: "erro")
    end
  end

  def delete(conn, %{"id" => id}) do
    {:ok, _todo} = Todo.delete(Todo.get!(id))

    conn
    |> put_flash(:info, gettext("Todo deleted successfully."))
    |> redirect(to: Routes.todo_path(conn, :index))
  end

  defp stream_replace(conn, html, params) do
    conn
    |> put_resp_header("Content-Type", "text/html; turbo-stream; charset=utf-8")
    |> put_layout(false)
    |> render(html, params)
  end
end
