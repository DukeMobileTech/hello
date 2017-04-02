ActiveAdmin.register Document do
  permit_params :category_id, :title, :description, :language, :doc_file
  belongs_to :category

  member_action :download, method: :get do
    category = Category.find params[:category_id]
    document = category.documents.find params[:id]
    redirect_to document.doc_file.expiring_url(10)
  end

  index do
    selectable_column
    column :id
    column :title
    column :language
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :language
      row :updated_at
      row :doc_file do |doc|
        if doc.doc_file_file_size
          link_to 'Download', download_admin_category_document_path(params[:category_id], doc)
        end
      end
    end
  end

  form do |f|
    f.inputs 'Document Details', multipart: true do
      f.input :language, collection: LanguageList::COMMON_LANGUAGES
      f.input :title
      f.input :description
      f.input :doc_file, as: :file
    end
    f.actions
  end
end
