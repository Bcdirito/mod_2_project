class ReviewsController < ApplicationController
  before_action :listener_logged, only: [:new, :create, :edit, :update, :delete]

    def index
      if !session[:musician_id].nil?
        @reviews = Review.all.select {|rev| rev.musician_id == session[:musician_id]}
      elsif !session[:listener_id].nil?
        @reviews = Review.all.select {|rev| rev.listener_id == session[:listener_id]}
      else
        redirect_to musicians_path
        flash[:message] = "Please Vist a musician to see reviews"
        return
      end
    end

    def show
      if Review.count == 0
        redirect_to musicians_path
        flash[:message] = "No Reviews."
        return
      elsif params[:id].to_i == 0 || params[:id].to_i > Review.last.id
        redirect_to musicians_path
        flash[:message] = "No Review with that id."
        return
      else
        @review = Review.find(params[:id])
      end
    end

    def new
      if session[:listener_id].nil?
        redirect_to "/login"
      end
      @review = Review.new
      @musicians = Musician.all
    end

    def create
      @review = Review.new(review_params)
      @review.listener_id = session[:listener_id]
      if @review.valid?
        @review.save
        redirect_to review_path(@review)
      else
        render :new
      end
    end

    def edit
      @review = Review.find(params[:id])
      @musicians = Musician.all
    end

    def update
      @review = Review.find(params[:id])
      @review.update(review_params)
      redirect_to review_path(@review)
    end

    def destroy
      @review = Review.find(params[:id])
      @listener = @review.listener_id
      @review.destroy
      redirect_to listener_path(@listener)
    end

  private

    def review_params
      params.require(:review).permit(:rating, :listener_id, :musician_id, :content)
    end
  end
