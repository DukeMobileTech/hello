class CategoriesController < ApplicationController
  # caches_action :index
  def index
    @categories = Category.all.order(updated_at: :desc)
  end
end
