class SearchController < ApplicationController
  skip_before_action :verify_authenticity_token
  def result
    @autos = []
    @request = ""
#Формируем sql-запрос по кусочкам (возможность поиска по определенным полям)    
    if params[:brand] != ""
      @request += " AND brand = :brand"
    end
    if params[:city] != ""
      puts "CITYYYY"
      @request += " AND city = :city"
    end
    if params[:model_search] != ""
      puts "MODELEEELL"
      @request += " AND model = :model"
    end  
    if (params[:priceFrom] != "") && (params[:priceUntil] != "")
      puts "PRICEEEEEEEEEE"
      @request += " AND price >= :priceFrom AND price <= :priceUntil"
    end
    if (params[:yearUntil] != "") && (params[:yearFrom] != "")
      puts "YEAAAAAAAAAAAAAAAAR"
      @request += " AND year >= :yearFrom AND year <= :yearUntil"
    end
    @request += " AND moder = true AND NOT offer_status = 0"
    @request = @request[4..-1]
###########################################################################
        puts @request
        
    case params[:Auto]
      when "1"
        @ref = "cars"
        @autos = Car.where(@request,
  {yearFrom: params[:yearFrom], yearUntil: params[:yearUntil], priceFrom: params[:priceFrom], priceUntil: params[:priceUntil], model: params[:model_search], city: params[:city], brand: params[:brand]}).paginate(:page => params[:page], :per_page => 10)
      when "2"
        @ref = "trucks"
        @autos = Truck.where(@request,
  {yearFrom: params[:yearFrom], yearUntil: params[:yearUntil], priceFrom: params[:priceFrom], priceUntil: params[:priceUntil], model: params[:model_search], city: params[:city], brand: params[:brand]}).paginate(:page => params[:page], :per_page => 10)
      when "3"
        @ref = "equips"
        @autos = Equip.where(@request,
  {yearFrom: params[:yearFrom], yearUntil: params[:yearUntil], priceFrom: params[:priceFrom], priceUntil: params[:priceUntil], model: params[:model_search], city: params[:city], brand: params[:brand]}).paginate(:page => params[:page], :per_page => 10)
    end
  end


  def update_cities
  	@cities = City.where("region_id = ?", params[:region_id])
  	respond_to do |format|
      format.js
    end
  end

  def update_brands
    case params[:type_id]
      when "1"
        @brands = Brand.all
      when "2"
        @brands = BrandTruck.all
      when "3"
        @brands = BrandEquip.all
    end
    respond_to do |format|
      format.js
    end
  end

  def update_marks_search
    case params[:type_id]
      when "1"
        @brand_id = Brand.find_by(name: params[:brand]).id
        @marks = Mark.where("brand_id = ?", @brand_id)
      when "2"
        @brand_id = BrandTruck.find_by(name: params[:brand]).id
        @marks = MarkTruck.where("brand_id = ?", @brand_id)
      when "3"
        @brand_id = BrandEquip.find_by(name: params[:brand]).id
        @marks = MarkEquip.where("brand_id = ?", @brand_id)
    end
    respond_to do |format|
      format.js
    end
  end  
end
