class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if @user["password"] == params["password"]
        flash["notice"] = "You've logged in."
        redirect_to "/"
          #/=taking home
      else
        flash["notice"] = "Wrong passowrd!"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Bad email!"
      redirect_to "/sessions/new"
    end
  end

  def destroy
  end
end
  