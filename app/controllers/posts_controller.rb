class PostsController < ApplicationController
  # caches_action :index, :language

  def index
    @category = Category.includes(:posts).find(params[:category_id])
  end

  def language
    @language = params[:language]
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
    @translations = @post.translations.where(language: params[:language])
    @transcripts = @post.transcripts.where(language: params[:language])
  end
end
