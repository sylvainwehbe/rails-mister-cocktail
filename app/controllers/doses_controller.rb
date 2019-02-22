class DosesController < ApplicationController
def new
  @dose = Dose.new
end

def create
  @cocktail = Cocktail.find(params[:cocktail_id])
  @dose = Dose.new(dose_params)
  @dose.cocktail = @cocktail
  if @dose.save
    redirect_to cocktail_path(@cocktail)
  else
    redirect_to @cocktail
    # raise
    # render 'new' # "cocktails/show"
  end
end

def destroy
  @cocktail = Cocktail.find(params[:id])
  find_dose
  @dose.destroy
  redirect_to cocktail_path(@cocktail)
end

private

def find_dose
  @dose = Dose.find(params[:cocktail_id])
end

def dose_params
  params.require(:dose).permit(:description, :ingredient_id)
end
end
