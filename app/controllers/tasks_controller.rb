class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.build(task_params)
    @task.user = current_user
    if @task.save
      redirect_to @project, notice: "Task added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @task.update(task_params)
      redirect_to @task.project, notice: "Task updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @task.project.tap do |project|
      @task.destroy
      redirect_to project, notice: "Task deleted."
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status, :user_id)
  end
end
