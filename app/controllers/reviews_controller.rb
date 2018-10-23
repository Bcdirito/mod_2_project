class ReviewsController < ApplicationController
    def index
      @reviews = Review.all
    end

    def show
      @review = Review.find(params[:id])
    end

    def new
      @review = Review.new
      @musicians = Musician.all
    end

    def create
      @review = Review.new(review_params)
      @review.save
      redirect_to review_path(@review)
    end

    def edit
      @review = Review.find(params[:id])
      @musicians = Musician.all
    end

    def update
      @review = Review.find(params[:id])
      @review.update(user_params)
      redirect_to review_path(@review)
    end

    def destroy
      @review = Review.find(params[:id])
      @user = @review.user_id
      @review.destroy
      redirect_to user_path(@user)
    end

  private

    def review_params
      params.require(:review).permit(:rating, :user_id, :profile_id, :content)
    end
  end
