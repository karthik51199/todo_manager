class User < ActiveRecord::Base
  has_many :todos
  has_secure_password

  def to_pleasant_string
    #"#{id}. #{name} #{email} #{password}"
    "#{id}. #{first_name} #{email} #{password_digest}"
  end
end
