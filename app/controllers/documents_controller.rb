class DocumentsController < ApplicationController
  # caches_action :index, :show

  def index
    @category = Category.find params[:category_id]
    @documents = @category.documents
  end

  def show
    document = Document.find params[:id]
    if document && document.doc_file_url
      redirect_to document.doc_file_url
    else
      redirect_to documents_path
    end
  end
end
