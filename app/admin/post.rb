ActiveAdmin.register Post do
  permit_params :title, :category_id, :transcript, :video
  belongs_to :category

  sidebar 'Audio Translations', only: :show do
    ul do
      li link_to 'Audio Translations', admin_post_translations_path(params[:id])
    end
  end

  index do
    selectable_column
    column :id
    column :title
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :updated_at
      row 'Number of audio translations' do |post|
        post.translations.size
      end
      row :video_updated_at
      row :video do |post|
        post.video ? video_tag(post.video.url, controls: true) : content_tag(:span, 'No Video')
      end
      row :transcript
    end
  end

  form do |f|
    f.inputs 'Post', multipart: true do
      f.input :title, label: 'Title'
      f.input :transcript, label: 'English Transcript'
      f.input :video, as: :file
    end
    f.actions
  end
end
