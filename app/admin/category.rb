ActiveAdmin.register Category do
  permit_params :name, :pictogram

  sidebar 'Posts', only: :show do
    ul do
      li link_to 'Videos', admin_category_posts_path(params[:id])
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
