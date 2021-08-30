class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @parent_categories = Category.where(parent_category: nil)

    if @category.parent_category == nil
      @adverts = Advert.joins(:categories).where(categories: @category.subcategories)
      @subcategories = @category.subcategories
    else
      @adverts = Advert.joins(:categories).where(categories: @category)
      @subcategories = @category.parent_category.subcategories
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_category
    #   @category = Category.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title, :id)
    end
end
