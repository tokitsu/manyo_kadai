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
    if params[:task][:search] == "true"
      @tasks = Task.where("name LIKE ?", "%#{ params[:task][:name] }%")
    elsif params[:sort_expired] == "true"
      @tasks = Task.all.order(expired_date: "DESC")
    else
      @tasks = Task.all.order(created_at: "DESC")
    end
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
    params.require(:task).permit(:name,:content,:expired_date,:status)
  end

end
