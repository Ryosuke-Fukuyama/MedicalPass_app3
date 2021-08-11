class Staff < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :validatable,:lockable, :timeoutable, :trackable
end
