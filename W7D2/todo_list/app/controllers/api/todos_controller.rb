class Api::TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    @todo = Todo.find(params[:id])
    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      redner json: @todo.errors.full_messages, status: 422
    end
  end

  def update
  end

  def destroy
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :body, :done)
  end

end
