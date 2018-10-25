class MusiciansController < ApplicationController
  before_action :musician_logged, only: [:edit, :update]
  before_action :log_out, only: [:new]

  def index
    @musicians = Musician.search(params[:search])
    if @musicians.count == 1
      redirect_to musician_path(@musicians.first.id)
      return
    end
  end

  def new
    @musician = Musician.new
    @genres = Genre.all
  end

  def show
    if id_checker(params[:id]) == true
      redirect_to musicians_path
      flash[:message] = "Invalid URL Path. Musician Does Not Exist"
      return
    end
    @musician = Musician.find(params[:id])
    review_info(@musician)
    if !@musician.band_members.nil?
      @split_members = @musician.band_members.split(",")
    end

    if !@musician.links.nil?
      @links = @musician.links.split(",")
    end
    # @genres = MusicianGenre.all.select {|genre| @musician.id = genre.musician_id}
    # @genres = @genres.map {|genre| Genre.find(genre.genre_id).name}
    @reviews = @musician.recent_reviews
  end

  def create
    if params[:musician][:password] != params[:musician][:password_confirmation]
      flash[:message] = "Password did not match confirmation"
      render :new
      return
    end


    @musician = Musician.new(musician_params)


    @musician.genre_id = params[:musician][:genre_id].to_i
    @musician.image_uploader(params[:musician][:image])

    if @musician.valid?
      @musician.save
      log_in_musician(@musician)
      redirect_to musician_path(@musician)
    else
      @errors = @musician.errors.full_messages
      @genres = Genre.all
      render :new
    end

  end

  def edit
    @musician = Musician.find(session[:musician_id])
    @genres = Genre.all
  end

  def update
    @musician = Musician.find(session[:musician_id])
    @musician.genre_id = params[:musician][:genre_id].to_i

    if !params[:musician][:image].nil?
      @musician.image_uploader(params[:musician][:image])
    end

    if @musician.update(musician_params)
      redirect_to musician_path(@musician)
    else
      @errors = @musician.errors.full_messages
      render :edit
    end
  end

  def destroy
    @musician = Musician.find(params[:id])
    Review.all.each do |review|
      if @musician.id == review.musician_id
        review.destroy
      end
    end
    @musician.destroy
    redirect_to "/"
  end

  private

  def musician_params
    params.require(:musician).permit(:name, :genre, :band_members, :bio, :image, :rate, :search, :user_name, :song, :links, :password, :password_confirmation)
  end
end
