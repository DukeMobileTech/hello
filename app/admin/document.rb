ActiveAdmin.register Document do
  permit_params :category_id, :title, :description, :language, :doc_file
  belongs_to :category

  member_action :download, method: :get do
    category = Category.find params[:category_id]
    document = category.documents.find params[:id]
    redirect_to document.doc_file_url
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
      row :description do |doc|
        doc.description.html_safe
      end
      row :updated_at
      row :doc_file do |doc|
        if doc.doc_file_url.present?
          link_to 'Download', download_admin_category_document_path(params[:category_id], doc)
        end
      end
    end
  end

  form do |f|
    f.inputs 'Document Details', multipart: true do
      f.input :language, collection: Settings.languages
      f.input :title
      f.input :description, as: :ckeditor
      if f.object.id
        f.input :doc_file, as: :file, hint: (f.object.doc_file_url ? content_tag(:span, "Current File Name: #{f.object.doc_file.metadata['filename']}") : content_tag(:span, 'No document'))
      end
    end
    f.actions
  end

  # controller do
  #   cache_sweeper :document_sweeper, :post_sweeper
  # end
end
