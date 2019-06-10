class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice]= "新規登録しました！"
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def index
    @tasks = Task.all
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    flash[:notice]= "編集しました！"
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice]= "削除しました！"
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :content)
  end

end
