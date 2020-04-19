class UsersController < ApplicationController
  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]

    user = User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    user.save!

    #id = user.id
    #response_msg = "The id of newly added user is #{id}"
    #render plain: response_msg
    redirect_to "/"
  end

  def show
    id = params[:id]
    user = User.find(id)

    render plain: user.to_pleasant_string
  end

  def update
    id = params[:id]
    password = params[:password]

    user = User.find(id)
    user.password = password
    user.save!

    render plain: "Password of user with id: #{id} has been updated"
  end
end
