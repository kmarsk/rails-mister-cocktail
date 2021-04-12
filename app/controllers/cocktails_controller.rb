class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @dose.destroy
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: "Your cocktail has been created"
    else
    render :new
  end
  end

  def destroys
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end



  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end


 def dose_params
    params.require(:cocktail).permit(:name)
  end
end
