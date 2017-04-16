ActiveAdmin.register Transcript do
  permit_params :title, :post_id, :language, :text
  belongs_to :post

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
      row :post
      row :title
      row :language
      row :updated_at
      row :created_at
      row :text do |transcript|
        transcript.text.html_safe
      end
    end
  end

  form do |f|
    f.inputs 'Transcript', multipart: true do
      f.input :title
      f.input :language, collection: Settings.languages
      f.input :text, as: :ckeditor
    end
    f.actions
  end

  controller do
    cache_sweeper :post_sweeper
  end
end
