class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(updated_at: :desc)
  end
end
