class MusiciansController < ApplicationController

  def index
    @musicians = Musician.search(params[:search])
  end

  def new
    @musician = Musician.new
    @genres = Genre.all
  end

  def show
    if id_checker(params[:id]) == true
      redirect_to musicians_path
      flash[:message] = "Invalid URL Path"
      return
    end
    @musician = Musician.find(params[:id])
    review_info(@musician)
    @genres = MusicianGenre.all.select {|genre| @musician.id = genre.musician_id}
    @genres = @genres.map {|genre| Genre.find(genre.genre_id).name}
    @reviews = @musician.recent_reviews
  end

  def create
    @musician = Musician.new(musician_params)
    @genres = params[:musician][:genre]
    @genres.shift

    if @musician.valid?
      @musician.save
      if !@genres.empty?
        @genres.each {|genre| MusicianGenre.create(musician_id: @musician.id, genre_id: Genre.find(genre.to_i).id)}
      end
      redirect_to musician_path(@musician)
    else
      render :new
    end

  end

  def edit
    @musician = Musician.find(params[:id])
    @genres = Genre.all
  end

  def update
    @musician = Musician.find(params[:id])
    @genres = params[:musician][:genre]
    @genres.shift

    @musgens = MusicianGenre.where(musician_id: @musician.id)
    @musgens.delete_all

    if @musician.update(musician_params)
      if !@genres.empty?
        @genres.each {|genre| MusicianGenre.create(musician_id: @musician.id, genre_id: Genre.find(genre.to_i).id)}
      end
      redirect_to musician_path(@musician)
    else
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
    params.require(:musician).permit(:name, :genre_ids, :band_members, :bio, :image, :rate, :search)
  end

  def id_checker(id)
    if id.to_i == 0 || id.to_i > Musician.last.id
      return true
    end
  end
end
