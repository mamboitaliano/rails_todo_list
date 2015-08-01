class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def created                   # <----- START HERE WHEN WORKING ON THE WHOLE ONE-PAGE JAVASCRIPT CLUSTERFUCK
    @todo = Todo.new(todo_params)
    if @todo.save!
      render json: @task, status: :created # <------------------ this simply returns an http status 201 (created) for testing purposes
    else
      render_errors(@todo)
    end
  end

  def show
    @todos = Todo.all
  end

  def update
  end

  def destroy
    todo(params[:id]).destroy
    redirect_to '/'
  end

  private

  def todo_params
    params.require(:todo).permit(:task, :text)
  end

  def todo(todo_id)
    Todo.find(todo_id)
  end
end
