class IceCreamsController < ApplicationController
	def index
		@ice_creams = IceCream.order_by_rating.includes(:brand)
	end

	def new
		@ice_cream = IceCream.new
		@ice_cream.build_brand
	end

	def create
		@ice_cream = IceCream.new(ice_cream_params)
		@ice_cream.user_id = session[:user_id]
		if @ice_cream.save
			redirect_to @ice_cream
		else
			render :new
		end
	end

	def show
		@ice_cream = IceCream.find_by_id(params[:id])
	end

	private

	def ice_cream_params
		params.require(:ice_cream).permit(:flavor, :description, :brand_id, brand_attributes: [:name])
  end
end
