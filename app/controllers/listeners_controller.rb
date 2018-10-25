class ListenersController < ApplicationController
  def show
    if !session[:listener_id].nil?
      @listener = Listener.find(session[:listener_id])
      review_info(@listener)
      render :show
    else
      redirect_to "/login"
    end
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

    @listener = Listener.new(user_params)
    byebug
    img = Cloudinary::Uploader.upload(params[:listener][:picture])
    @listener.picture = img['url']
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
    @listener = Listener.find(params[:id])
  end

  def update
    @listener = Listener.find(params[:id])
    byebug
    if !params[:listener][:picture].nil?
      img = Cloudinary::Uploader.upload(params[:listener][:picture])
      @listener.picture = img['url']
    end
    @listener.update(user_params)
    redirect_to user_path(@listener)
  end

  def destroy
    @listener = Listener.find(params[:id])
    Review.all.each do |review|
      if @listener.id == review.user_id
        review.destroy
      end
    end
    @listener.destroy
    redirect_to "/"
  end


  private

  def user_params
    params.require(:listener).permit(:first_name, :last_name, :user_name, :password, :password_confirmation, :picture)
  end
end
