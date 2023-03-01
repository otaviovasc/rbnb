class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :accommodations
  has_many :rentals
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
