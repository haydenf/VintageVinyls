class ReviewsController < ApplicationController
    before_action :review_params, only: [:create]

    def new
        @review = Review.new

    end

    def create
        @review = Review.new(review_params)
    end

    private

    def review_params
        params.require(:review).permit(:comment)
    end

end