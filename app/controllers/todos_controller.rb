class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #  render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.find(id)
    render plain: todo.to_pleasant_string
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    completed = false
    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: completed)

    #response_msg = "Hey,The id of the newly created todo is #{new_todo.id}"
    #render plain: response_msg
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]

    todo = Todo.find(id)
    todo.completed = completed
    todo.save!

    #render plain: "The completed status of todo is #{completed}"
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
