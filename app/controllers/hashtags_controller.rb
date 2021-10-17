class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find(params[:id])
  
    @adverts = Advert.where(status: :published).joins(:hashtags).where(hashtags: @hashtag).page(params[:page])
    @parent_categories = Category.where(parent_category: nil)
  end
end
