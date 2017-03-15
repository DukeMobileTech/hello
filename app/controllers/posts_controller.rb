class PostsController < ApplicationController
  def index
    @category = Category.includes(:posts, :translations).find(params[:category_id])
    @posts = @category.posts
  end
end
