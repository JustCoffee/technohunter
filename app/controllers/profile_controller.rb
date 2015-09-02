class ProfileController < ApplicationController
  def show
  	authorize! :view_profile, @profile
  	@cars = Car.where("user_id = ?", current_user)
  	@trucks = Truck.where("user_id = ?", current_user)
  	@equips = Equip.where("user_id = ?", current_user)
  end
end
