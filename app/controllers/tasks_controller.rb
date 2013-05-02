class TasksController < ApplicationController

  def new
    @task = Task.new
    @list = List.find(params[:list_id])
  end

  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to list_path(@task.list)
    else
      render 'new'
    end
  end

  def edit
    @task = Task.find(params[:id])
    @list = @task.list
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    redirect_to list_path(@task.list)
  end

end
