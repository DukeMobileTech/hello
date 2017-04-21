ActiveAdmin.register Page do
  permit_params :category_id, :text, :title, :tag

  index do
    selectable_column
    column :id
    column :title
    column :tag
    column :text do |res|
      truncate res.text.html_safe
    end
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :tag
      row :category
      row :updated_at
      row :created_at
      row :text do |res|
        res.text.html_safe
      end
    end
  end

  form do |f|
    f.inputs 'Page Details', multipart: true do
      f.input :title, label: 'Title (required)'
      f.input :tag, collection: Settings.page_tags, label: 'Tag (required)'
      f.input :category_id, as: :select, collection: Category.all.map { |c| [c.name, c.id] }, label: 'Category (optional)'
      f.input :text, as: :ckeditor, label: 'Text (required)'
    end
    f.actions
  end
  # controller do
  #   cache_sweeper :resource_sweeper
  # end
  controller do
    def scoped_collection
      if params[:category_id].present?
        Page.where(category_id: params[:category_id])
      else
        Page.all
      end
    end
  end
end
