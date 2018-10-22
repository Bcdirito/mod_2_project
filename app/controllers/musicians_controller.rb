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
  end

  def create
    byebug
    @musician = Musician.new(musician_params)

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
    params.require(:musician).permit(:name, :genres, :band_members, :bio, :image, :rate)
  end
end
