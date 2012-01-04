class CategoriesController < ApplicationController
  def index
    @picture_categories = PictureCategory.all
  end
end
