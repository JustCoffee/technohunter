# encoding: utf-8

class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.where("moder = ? AND NOT offer_status = 0", true).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
    @bid = Bid.new
    @pic = @truck.pictures
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
#    Раскоментить, когда будет готова БД
#    @brands = BrandTruck.all
#    @marks = MarkTruck.where("brand_id = ?", BrandTruck.first.id)
  end

  # GET /trucks/1/edit
  def edit
    authorize! :update_truck, @truck
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @user = current_user
#    if params[:truck][:brand] == "Other..." Раскоментить, когда буедт готова БД
      params[:truck][:brand] = params[:other_brand][0]
      params[:truck][:model] = params[:other_model][0]
#    end  
    @truck = @user.trucks.build(truck_params)
    respond_to do |format|
      if @truck.save
        if params[:images]
          params[:images].each { |image|
            @truck.pictures.create(image: image)
          }
        end
        format.html { redirect_to @truck, notice: 'create' }
        format.json { render :show, status: :created, location: @truck }
      else
# Добавить по готовности БД марок/моделей
#        @brands = BrandTruck.all
#        @marks = MarkTruck.where("brand_id = ?", BrandTruck.first.id)
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        if params[:images]
          if @truck.pictures.first
            puts "FIRST PIC FOUND!"
            @truck.pictures.each { |pic|
              pic.image = nil
              pic.save
              pic.destroy
            }
            @truck.save
          end
          params[:images].each { |image|
            @truck.pictures.create(image: image)
          }
        end
        format.html { redirect_to @truck, notice: 'Обяъвление было успешно обновлено!' }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    authorize! :destroy_truck, @truck
    @truck.offer_status = 0
    @truck.save
    respond_to do |format|
      format.html { redirect_to :controller => 'offers', :action => 'comment', :offer_id => @truck.id, :type => 'truck' }
      format.json { head :no_content }
    end
  end

  def update_cities
    @region_id = Region.find_by(name: params[:region])
    @cities = City.where("region_id = ?", @region_id)
    respond_to do |format|
      format.js
    end
  end

  def update_marks_truck
    @brand_id = BrandTruck.find_by(name: params[:brand]).id
    @marks = MarkTruck.where("brand_id = ?", @brand_id)
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(:vin_code ,:region ,:city, :type_avto, :brand, :model, :year, 
                                    :mileage, :engine, :engv, :hofuse, :status, :desc, :price)
    end
end
