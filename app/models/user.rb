class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # this allows a user to create multiple listings 
  has_many :listings

  # devise authentications for users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
