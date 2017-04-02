ActiveAdmin.register Category do
  permit_params :name, :pictogram

  sidebar 'Category Posts', only: :show do
    ul do
      li link_to 'Posts', admin_category_posts_path(params[:id])
      li link_to 'Documents', admin_category_documents_path(params[:id])
    end
  end

  index do
    selectable_column
    column :id
    column :name
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :updated_at
      row 'Number of posts' do |category|
        category.posts.size
      end
      row :pictogram do |category|
        category.pictogram ? image_tag(category.pictogram.url(:medium)) : content_tag(:span, 'No Pictogram')
      end
    end
  end

  form do |f|
    f.inputs 'Category Details', multipart: true do
      f.input :name, label: 'Name'
      f.input :pictogram, as: :file
    end
    f.actions
  end
end
