class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @parent_categories = Category.where(parent_category: nil)

    if @category.parent_category == nil
      @adverts = Advert.where(status: :published).joins(:categories).where(categories: @category.subcategories)
      @subcategories = @category.subcategories
    else
      @adverts = Advert.where(status: :published).joins(:categories).where(categories: @category)
      @subcategories = @category.parent_category.subcategories
    end
  end

end
