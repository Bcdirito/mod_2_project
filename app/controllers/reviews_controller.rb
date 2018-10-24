class ReviewsController < ApplicationController
    def index
      if session[:review_class] == "musician"
        @reviews = Review.musician_filter(session[:review_id])
      elsif session[:review_class] == "user"
        @reviews = Review.user_filter(session[:review_id])
      else
        redirect_to musicians_path
        flash[:message] = "Visit Musician or Profile page first."
      end
    end

    def show
      @review = Review.find(params[:id])
    end

    def new
      if session[:user_id].nil?
        redirect_to "/login"
      end
      @review = Review.new
      @musicians = Musician.all
    end

    def create
      @review = Review.new(review_params)
      @review.user_id = session[:user_id]
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
      params.require(:review).permit(:rating, :user_id, :musician_id, :content)
    end
  end
