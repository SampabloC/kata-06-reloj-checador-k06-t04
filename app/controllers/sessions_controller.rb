class SessionsController < ApplicationController

  def validation
  end

  def create
    @admin = Administrator.find_by email_admin:params[:email_admin]

    if @admin && @admin.authenticate(params[:password])
      session[:administrator_id] =  @admin.id
      return redirect_to administrators_path
    end
      redirect_to login_path

  end

  def destroy
    session[:administrator_id] = nil

    redirect_to root_path
  end
end
