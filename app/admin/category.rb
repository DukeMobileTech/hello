ActiveAdmin.register Category do
  permit_params :name, :pictogram

  sidebar 'Category Posts', only: :show do
    ul do
      li link_to 'Posts/Videos', admin_category_posts_path(params[:id])
      li link_to 'Documents', admin_category_documents_path(params[:id])
      li link_to 'Pages/Links', admin_pages_path(category_id: params[:id])
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
        category.pictogram_url(:medium) ? image_tag(category.pictogram_url(:medium)) : content_tag(:span, 'No Pictogram')
      end
    end
  end

  form do |f|
    f.inputs 'Category Details', multipart: true do
      f.input :name
      f.input :pictogram, as: :file, hint: (f.object.pictogram_url(:medium) ? image_tag(f.object.pictogram_url(:thumb)) : content_tag(:span, 'No Pictogram'))
    end
    f.actions
  end

  # controller do
  #   cache_sweeper :category_sweeper
  # end
end
