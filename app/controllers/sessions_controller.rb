class SessionsController < ApplicationController
  def new
  end

  def create
    if login(params[:email], params[:password], params[:remember_me])
      redirect_back_or_to root_url, notice: 'Logged in'
    else
      flash.now.alert = "Email of password are incorrect!"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: "Logged out"
  end
end
