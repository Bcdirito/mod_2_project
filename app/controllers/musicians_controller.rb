class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def new
    @musician = Musician.new
    @genres = Genre.all
  end

  def show
    @musician = Musician.find(params[:id])
    byebug
  end

  def create
    @musician = Musician.new(musician_params)
    byebug

    if @musician.valid?
      @musician.save
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


    if @musician.valid?
      @musician.update(musician_params)
      redirect_to musician_path(@musician)
    else
      render :edit
    end
  end

  def destroy
    @musician = Musician.find(params[:id])
    @musician.destroy
  end

  private

  def musician_params
    params.require(:musician).permit(:name, :genre_ids, :band_members, :bio, :image, :rate)
  end
end
