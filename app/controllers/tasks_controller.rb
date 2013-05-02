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

end
