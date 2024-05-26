class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        flash["notice"] = "You've logged in."
        session["user_id"] = @user["id"]
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
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to "/sessions/new"
  end
end
  