class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :new]
  before_action :correct_user, only: [:destroy]
  before_action :set_task,only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user
  
  def index
    @tasks= current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end  
  
  def edit
    @task = current_user.tasks.find(params[:id])
  end  
  
  def update
    @task = current_user.tasks.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end  
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
