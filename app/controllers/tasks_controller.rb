class TasksController < ApplicationController

  before_action :authenticate_user

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      flash[:notice]= "新規登録しました！"
      redirect_to tasks_path
    else
      render "new"
    end
  end

  def index
    if params[:sort_priority] == "true"
      @tasks = Task.all.order(priority: "ASC").page(params[:page])

    elsif params[:sort_expired] == "true"
      @tasks = Task.all.order(expired_date: "ASC").page(params[:page])

    else
      @tasks = Task.all.order(created_at: "DESC").page(params[:page])

    end
  end

  def search
    if params[:task][:name].present? && params[:task][:status].present?
      @tasks = Task.name_status_search(params[:task][:name], params[:task][:status]).page(params[:page])
      flash[:notice] = "検索結果を表示しています。"
      render "index"
    elsif params[:task][:status].present?
      @tasks = Task.status_search(params[:task][:status]).page(params[:page])
      flash[:notice] = "検索結果を表示しています。"
      render "index"
    elsif
      flash[:notice] = "検索項目を入力してください"
      render "index"
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
    params.require(:task).permit(:name,:content,:expired_date,:status,:priority)
  end

end
