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
    case @type
    when "truck"
      BrandTruck.find_or_create_by(name: @offer.brand)
      @id = BrandTruck.find_by(name: @offer.brand).id
      MarkTruck.find_or_create_by(name: @offer.model, brand_id: @id)
    when "equip"
      BrandEquip.find_or_create_by(name: @offer.brand)
      @id = BrandEquip.find_by(name: @offer.brand).id
      MarkEquip.find_or_create_by(name: @offer.model, brand_id: @id)
    end
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
        @type = "car"
      when "truck"
        @offer = Truck.find(params[:id])
        @type = "truck"
      when "equip"
        @offer = Equip.find(params[:id])
        @type = "equip"
      end
    end
end

