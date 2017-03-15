ActiveAdmin.register Post do
  permit_params :title, :category_id, :transcript, :video
  belongs_to :category

  sidebar 'Audio Translations', only: :show do
    ul do
      li link_to 'Audios', admin_post_translations_path(params[:id])
    end
  end

  form do |f|
    f.inputs 'Post' do
      f.input :title, label: 'Title'
      f.input :transcript, label: 'English Transcript'
      f.input :video, as: :file
    end
    f.actions
  end
end
