# encoding: utf-8 
class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]


  # GET /cars
  # GET /cars.json
  def index
    @cars = Car.where("moder = ? AND NOT offer_status = 0", true).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @bid = Bid.new
    @pic = @car.pictures
    if can? :show_moder_panel, @car
      @user = User.find_by(id: @car.user_id)
    end
  end

  # GET /cars/new
  def new
    @car = Car.new
    @brands = Brand.all
    @marks = Mark.where("brand_id = ?", Brand.first.id)
  end

  # GET /cars/1/edit
  def edit
    authorize! :update_car, @car
  end

  # POST /cars
  # POST /cars.json
  def create
    @user = current_user
    if params[:car][:brand] == "Other..."
      params[:car][:brand] = params[:other_brand][0]
      params[:car][:model] = params[:other_model][0]
    end
    @car = @user.cars.build(car_params)
    respond_to do |format|
      if @car.save
        if params[:images]
          params[:images].each { |image|
            @car.pictures.create(image: image)
          }
        end
        format.html { redirect_to @car, notice: 'Обяъвление было успешно создано и в данный момент проходит модерацию' }
        format.json { render :show, status: :created, location: @car }
      else
        @brands = Brand.all
        @marks = Mark.where("brand_id = ?", Brand.first.id)
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        if params[:images]
          if @car.pictures.first
            puts "FIRST PIC FOUND!"
            @car.pictures.each { |pic|
              pic.image = nil
              pic.save
              pic.destroy
            }
            @car.save
          end
          params[:images].each { |image|
            @car.pictures.create(image: image)
          }
        end
        format.html { redirect_to @car, notice: 'Обяъвление было успешно обновлено!' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    authorize! :destroy_car, @car
    @car.offer_status = 0
    @car.save
    respond_to do |format|
      format.html { redirect_to :controller => 'offers', :action => 'comment', :offer_id => @car.id, :type => 'car' }
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

  def update_marks
    @brand_id = Brand.find_by(name: params[:brand]).id
    @marks = Mark.where("brand_id = ?", @brand_id)
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:region ,:title,:tel,:city,:auto_type,:brand,:model,:engine,
        :cuzov,:probeg,:kpp,:engv,:privod,:year,:sost,:photo,:desc,:price, :vin_code)
    end
end
