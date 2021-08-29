class CategoriesController < ApplicationController
  def show
    @adverts = Advert.joins(:categories).where(categories: Category.find(params[:id]))
    render 'adverts/index'
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
