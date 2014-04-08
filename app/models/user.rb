class User < ActiveRecord::Base
  has_many :reviews
  has_many :queue_items
  has_secure_password validations: false
  validates_presence_of :email, :password, :full_name
end
