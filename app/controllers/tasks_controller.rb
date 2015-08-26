class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Project.find(params[:project_id]).tasks.new(task_params)

    if @task.save
      render 'create'
    else
      render template: 'tasks/error'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :comment, :complete, :priority)
  end
end
