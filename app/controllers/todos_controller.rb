class TodosController < ApplicationController

  # stops the controler before executing the methods in the array
  before_action :set_todo, only: [:show, :edit, :update, :destroy]


# GET METHODS (rake routes to see)
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  # POST METHOD
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Your task was created."
      redirect_to todos_path
    else
      flash[:notice] = "Oops something went wrong"
      render "new"
    end
  end

  # PATCH METHOD
  def update
    @todo = Todo.find(params[:id])
    if @todo.update_attributes(todo_params)
      flash[:notice] = "Your todo was updated"
      redirect_to todos_path
    else
      flash[:notice] = "It could not be updated"
      render "edit"
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_url
  end


  # private is to say this method is to be used within this Class
  # here we define the attributes of a new object of Todo class
  # it's called strong parameters in Rails

  private

  def todo_params
    # (:todo) is the class, (:title) is the attribute
    params.require(:todo).permit(:title)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end


end










