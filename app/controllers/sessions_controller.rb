class SessionsController < ApplicationController
  def new
    render "new"
  end

  def create
    email = params[:email]
    user = User.find_by(email: email)
    if user && user.authenticate(params[:password])
      render plain: "Correct password"
    else
      render plain: "Wrong password"
    end
  end
end
