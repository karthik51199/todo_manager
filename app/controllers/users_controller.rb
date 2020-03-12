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
end
