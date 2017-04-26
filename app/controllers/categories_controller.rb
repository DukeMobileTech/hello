class CategoriesController < ApplicationController
  # caches_action :index
  def index
    @categories = Category.all.order(position: :asc)
  end
end
