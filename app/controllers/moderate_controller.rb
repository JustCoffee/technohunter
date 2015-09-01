class ModerateController < ApplicationController
  def index
  	authorize! :show_moder_panel, @Moder
  	@trucks = Truck.where("moder = ?", false)
    @cars = Car.where("moder = ?", false)
    @equips = Equip.where("moder = ?", false)
  end

  def send_offer
  	authorize! :send_offer, @Moder
  	set_offer
    @offer.moder = true
    @offer.offer_status = 2
    if @offer.save
    	redirect_to "/moderate/index", :alert => "Success"
    else
    	redirect_to "/moderate/index", :alert => "Error!!!"
    end
  end

  def dell_offer
    authorize! :send_offer, @Moder
    set_offer
    @offer.destroy
    redirect_to "/moderate/index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      case params[:type] #type смотрим в index'e, он означает, в какой таблице искать объявление
      when "car"
        @offer = Car.find(params[:id])
      when "truck"
        @offer = Truck.find(params[:id])
      when "equip"
        @offer = Equip.find(params[:id])
      end
    end
end

