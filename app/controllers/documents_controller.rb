class DocumentsController < ApplicationController
  def show
    category = Category.find params[:category_id]
    document = category.documents.find params[:id]
    redirect_to document.doc_file.expiring_url(10)
  end
end
