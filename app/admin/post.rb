ActiveAdmin.register Post do
  permit_params :title, :category_id, :video, :subtitle
  belongs_to :category

  sidebar 'Audio Translations', only: :show do
    ul do
      li link_to 'Audio Translations', admin_post_translations_path(params[:id])
      li link_to 'Speech Transcripts', admin_post_transcripts_path(params[:id])
      li link_to 'External Resources/Links', admin_post_resources_path(params[:id])
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
      row 'Number of speech transcripts' do |post|
        post.transcripts.size
      end
      row :video_file_name
      row :video do |post|
        post.video ? video_tag(post.video.url, controls: true) : content_tag(:span, 'No Video')
      end
      row :subtitle_file_name
    end
  end

  form do |f|
    f.inputs 'Post', multipart: true do
      f.input :title, label: 'Title'
      f.input :video, as: :file, hint: (f.object.video_file_name ? video_tag(post.video.url, size: '100x75') : 'No video')
      f.input :subtitle, as: :file, hint: (f.object.subtitle_file_name ? content_tag(:span, "Current File Name: #{f.object.subtitle_file_name}") : content_tag(:span, 'No subtitle'))
    end
    f.actions
  end

  # controller do
  #   cache_sweeper :post_sweeper
  # end
end
