class ApplicationController < ActionController::Base
  
  include SessionsHelper    
  include Pagy::Backend
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_tasks = user.tasks.count
  end
  
  def authenticate_user
    if @current_user == nil
      redirect_to login_url
    end
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
