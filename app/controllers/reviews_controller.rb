class ReviewsController < ApplicationController
	before_action :set_ice_cream

	def index
	end

	def new
		
		@review = @ice_cream.reviews.build
	end

	def create
		Review.create(review_params)
		if @review.save
			redirect_to review_path(@review)
		else
			render :new
		end
	end

	def show

	end


	private 

	def review_params
		params.require(:review).permit(:ice_cream_id, :stars, :title, :content)
	end
	def set_ice_cream
		@ice_cream = IceCream.find_by_id(params[:ice_cream_id])
	end
end
