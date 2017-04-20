class VideosController < ApplicationController
  def index
    @posts = Post.all.order(updated_at: :desc).page(params[:page]).per(10)
  end
end
