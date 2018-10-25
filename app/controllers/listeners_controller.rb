class ListenersController < ApplicationController
  before_action :listener_logged, only: [:show, :edit, :update, :destroy]

  def show
    @listener = Listener.find(session[:listener_id])
    review_info(@listener)
  end

  def new
    if !session[:listener_id].nil?
      log_out
      flash[:message] = "You have been logged out."
    end
    @listener = Listener.new
  end

  def create
    if params[:listener][:password] != params[:listener][:password_confirmation]
      flash[:message] = "Password did not match confirmation"
      redirect_to new_listener_path
      return
    end

    @listener = Listener.new(listener_params)
    @listener.image_uploader(params[:listener][:picture])
    if @listener.valid?
      @listener.save
      log_in_listener(@listener)
      redirect_to listener_path(@listener)
    else
      flash[:messages] = @listener.errors.full_messages
      render :new
    end
  end

  def edit
    @listener = Listener.find()
  end

  def update
    @listener = Listener.find(params[:id])
    byebug
    if !params[:listener][:picture].nil?
      img = Cloudinary::Uploader.upload(params[:listener][:picture])
      @listener.picture = img['url']
    end
    @listener.update(listener_params)
    redirect_to listener_path(@listener)
  end

  def destroy
    @listener = Listener.find(params[:id])
    Review.all.each do |review|
      if @listener.id == review.listener_id
        review.destroy
      end
    end
    @listener.destroy
    redirect_to "/"
  end


  private
  def listener_params
    params.require(:listener).permit(:first_name, :last_name, :user_name, :password, :password_confirmation, :picture)
  end
end
