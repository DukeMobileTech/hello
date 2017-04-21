class PagesController < ApplicationController
  def index
    @tag = params[:tag]
    @pages = Page.where(tag: @tag)
  end

  def show
    @page = Page.find params[:id]
  end
end
