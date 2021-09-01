class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @parent_categories = Category.where(parent_category: nil)

    if @category.parent_category == nil
      @adverts = Advert.where(status: :published).joins(:categories).where(categories: @category.subcategories).page(params[:page])
      @subcategories = @category.subcategories
    else
      @adverts = Advert.where(status: :published).joins(:categories).where(categories: @category).page(params[:page])
      @subcategories = @category.parent_category.subcategories
    end
  end

end
