class IngredientsController < ApplicationController

    def index
      @ingredients = Ingredient.all
    end

    def new
      @ingredient = Ingredient.new
    end

    def create
      ingredient = Ingredient.create(ingredient_params)
      redirect_to ingredient
    end

    def show
      @ingredient = Ingredient.find(params[:id])
    end

    def edit
      @ingredient = Ingredient.find(params[:id])
    end

    def update
      ingredient = Ingredient.find(params[:id])
      ingredient.update(ingredient_params)
      redirect_to ingredient
    end

    def destroy

    end

    
    def ingredient_params
      params.require(:ingredient).permit(:name)
    end

end
