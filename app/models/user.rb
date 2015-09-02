class User < ActiveRecord::Base
  has_many :offers
  has_many :cars
  has_many :trucks
  has_many :equips
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = {1 => :provider, 2 => :customer, 3 => :moder}

  def role?(role_name)
  	user_role == role_name
  end

end
