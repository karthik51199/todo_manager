class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]

    user = User.create!(name: name, email: email, password: password)
    user.save!

    id = user.id
    response_msg = "The id of newly added user is #{id}"

    render plain: response_msg
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

  def check
    email = params[:email]
    password = params[:password]
    flag = true

    user = User.find_by(email: email)
    flag = false if user == nil

    if flag
      flag = false if user.password != password
    end

    render plain: flag
  end
end
