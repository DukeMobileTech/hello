class PostsController < ApplicationController
  caches_action :index, :show

  def index
    @category = Category.includes(:posts, :documents).find(params[:category_id])
  end

  def show
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
    @translations = @post.translations.where(language: params[:language])
    @transcripts = @post.transcripts.where(language: params[:language])
  end
end
