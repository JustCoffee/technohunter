class BidsController < ApplicationController
	before_action :set_bid, only: [:close]
# status = 0 - заявка удалена
# status = 1 - заявка создана
# status = 2 - менеджер дозвонился
# ...

	def create
		@bid = Bid.new
		@bid.fname = params[:bid][:fname]
		@bid.lname = params[:bid][:lname]
		@bid.patr = params[:bid][:patr]
		@bid.tel = params[:bid][:tel]
		@bid.email = params[:bid][:email]
		@bid.offer_id = params[:bid][:offer]
		@bid.aut_type = params[:bid][:aut_type]
		@bid.status = 1
		@bid.save
	end

	def show
		@bids = Bid.where.not("status = ?", 0)
	end

	def close
		@bid.status = 0
		@bid.save
	    respond_to do |format|
	      format.html { redirect_to "/bids/show", notice: 'Bid was successfully closed.' }
	      format.json { head :no_content }
	    end
	end

	private
		def set_bid
	      @bid = Bid.find(params[:id])
	    end
end
