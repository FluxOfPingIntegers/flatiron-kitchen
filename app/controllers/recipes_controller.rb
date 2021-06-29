class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
      end
  
      def new
        @recipe = Recipe.new
        @ingredients = Ingredient.all
      end
  
      def create
        recipe = Recipe.create(recipe_params)
        binding.pry
        redirect_to recipe
      end
  
      def show
        @recipe = Recipe.find(params[:id])
      end
  
      def edit
        @recipe = Recipe.find(params[:id])
      end
  
      def update
        recipe = Recipe.find(params[:id])
        Recipe.update(recipe_params)
        redirect_to recipe
      end
  
      def destroy
  
      end
  
      
      def recipe_params
        params[:recipe][:ingredient_ids] = params[:recipe][:ingredient_ids].select {|i| !i.empty?}
        params.require(:recipe).permit(:name, :ingredient_ids)
      end
  
end
