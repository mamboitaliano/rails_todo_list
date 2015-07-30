class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.all
  end

  def create
    @todo = Todo.create(todo_params)
    redirect_to '/'
  end

  def show
  end

  def update
  end

  def destroy
    todo(params[:id]).destroy
    redirect_to '/'
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :text)
  end

  def todo(todo_id)
    Todo.find(todo_id)
  end
end
