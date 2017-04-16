ActiveAdmin.register Resource do
  permit_params :post_id, :text
  belongs_to :post

  index do
    selectable_column
    column :id
    column :text do |res|
      truncate res.text.html_safe
    end
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :updated_at
      row :created_at
      row :text do |res|
        res.text.html_safe
      end
    end
  end

  form do |f|
    f.inputs 'Resource Details', multipart: true do
      f.input :text, as: :ckeditor
    end
    f.actions
  end
  controller do
    cache_sweeper :resource_sweeper
  end
end
