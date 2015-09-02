class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token
  # GET /offers
  # GET /offers.json
  def index
    @cars = Car.where("moder = ? AND NOT offer_status = 0 AND NOT offer_status = 1", true).last(4)
    @trucks = Truck.where("moder = ? AND NOT offer_status = 0 AND NOT offer_status = 1", true).last(4)
    @equips = Equip.where("moder = ? AND NOT offer_status = 0 AND NOT offer_status = 1", true).last(4)
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  def comment
  end

  def add_comment
    case params[:type][0]
    when 'car'
      @offer = Car.find(params[:offer_id][0])
    when 'truck'
      @offer = Truck.find(params[:offer_id][0])
    when 'equip'
      @offer = Equip.find(params[:offer_id][0])
    end

    @offer.comment = params[:comment][0]
    respond_to do |format|
      if @offer.save
        format.html { redirect_to "/", notice: 'comment' }
      end
    end
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
    authorize! :update, @offer
  end

  # POST /offers
  # POST /offers.json
  def create
    @user = current_user
    @offer = @user.offers.build(offer_params)
    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'create' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'update' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    authorize! :destroy, @offer
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'destroy' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:comment, :offer_id, :type)
    end
end
