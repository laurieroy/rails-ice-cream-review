class ReviewsController < ApplicationController
	before_action :set_ice_cream, only: %i[index show new]
	before_action :set_review, only: %i[show new]

	def index
		if params[:ice_cream_id] && @ice_cream = IceCream.find_by_id(params[:ice_cream_id])
			@reviews = @ice_cream.reviews.all
		else
			@reviews = Review.all
		end
	end

	def new
		if @ice_cream = IceCream.find_by_id(params[:ice_cream_id])
			@review = @ice_cream.reviews.build
		else
			@review = Review.new
		end
	end

	def create
		@review = current_user.reviews.build(review_params)
		if @review.save
			redirect_to @review
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

	def set_review
		@review = Review.find_by_id(params[:id])
	end

	def set_ice_cream
		@ice_cream = IceCream.find_by_id(params[:ice_cream_id])
	end
end
