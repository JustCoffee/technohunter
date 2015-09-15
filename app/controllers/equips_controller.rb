# encoding: utf-8 
class EquipsController < ApplicationController
  before_action :set_equip, only: [:show, :edit, :update, :destroy]

  # GET /equips
  # GET /equips.json
  def index
    @equips = Equip.where("moder = ? AND NOT offer_status = 0", true).paginate(:page => params[:page], :per_page => 10)
  end

  # GET /equips/1
  # GET /equips/1.json
  def show
    @bid = Bid.new
    @pic = @equip.pictures
    if can? :show_moder_panel, @equip
      @user = User.find_by(id: @equip.user_id)
    end
  end

  # GET /equips/new
  def new
    @equip = Equip.new

#    @brands = BrandEquip.all
#    @marks = MarkEquip.where("brand_id = ?", BrandEquip.first.id)
  end

  # GET /equips/1/edit
  def edit
    authorize! :update_equip, @equip
  end

  # POST /equips
  # POST /equips.json

  #Сделать добавление новой марки
  def create
    @user = current_user
#    if params[:equip][:brand] == "Other..."
      params[:equip][:brand] = params[:other_brand][0]
      params[:equip][:model] = params[:other_model][0]
#    end
    @equip = @user.equips.build(equip_params)
    respond_to do |format|
      if @equip.save
        if params[:images]
          params[:images].each { |image|
            @equip.pictures.create(image: image)
          }
        end
       format.html { redirect_to @equip, notice: 'Объявление успешно создано и в данный момент проходит модерацию.' }
       format.json { render :show, status: :created, location: @equip }
      else
        format.html { render :new }
        format.json { render json: @equip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equips/1
  # PATCH/PUT /equips/1.json
  def update
    respond_to do |format|
      if @equip.update(equip_params)
        if params[:images]
          if @equip.pictures.first
            puts "FIRST PIC FOUND!"
            @equip.pictures.each { |pic|
              pic.image = nil
              pic.save
              pic.destroy
            }
            @equip.save
          end
          params[:images].each { |image|
            @equip.pictures.create(image: image)
          }
        end
        format.html { redirect_to @equip, notice: 'Объявление было успешно изменено!' }
        format.json { render :show, status: :ok, location: @equip }
      else
        format.html { render :edit }
        format.json { render json: @equip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equips/1
  # DELETE /equips/1.json
  def destroy
    authorize! :destroy_equip, @equip
    @equip.offer_status = 0
    @equip.save
    respond_to do |format|
      format.html { redirect_to :controller => 'offers', :action => 'comment', :offer_id => @equip.id, :type => 'equip' }
      format.json { head :no_content }
    end
  end

  def update_marks_equip
    @brand_id = BrandEquip.find_by(name: params[:brand]).id
    @marks = MarkEquip.where("brand_id = ?", @brand_id)
    respond_to do |format|
      format.js
    end
  end

  def update_cities
    @region_id = Region.find_by(name: params[:region])
    @cities = City.where("region_id = ?", @region_id)
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equip
      @equip = Equip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equip_params
      params.require(:equip).permit(:vin_code ,:region ,:city, :equip_type, :other_brand, :other_model ,:brand, :model, :year, :hofuse, :status, :desc, :price)
    end
end
