ActiveAdmin.register Post do
  permit_params :title, :category_id, :video, :subtitle
  belongs_to :category

  sidebar 'Audio Translations', only: :show do
    ul do
      li link_to 'Audio Translations', admin_post_translations_path(params[:id])
      li link_to 'Speech Transcripts', admin_post_transcripts_path(params[:id])
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
      # row 'Video File Name' do |post|
      # post.video.filename
      # post.video[:video].metadata['filename'] if post.video.present?
      # end
      # row :video do |post|
      #   video_tag(post.video[:video].url)
      # end
      # row :video do |post|
      #   image_tag post.video_url(:screenshot)
      #   # image_tag(post.video[:screenshot].url) if post.video.present?
      # end

      # TODO: Play with subtitles
      row :video do |post|
        post.video_url(:video) ? video_tag(post.video_url(:video), controls: true) : content_tag(:span, 'No Video')
      end
      row :subtitle do |post|
        post.subtitle ? post.subtitle.metadata['filename'] : content_tag(:span, 'No Subtitle File')
      end
    end
  end

  form do |f|
    f.inputs 'Post', multipart: true do
      f.input :title, label: 'Title'
      f.input :video, as: :file, hint: (f.object.video_url(:screenshot) ? image_tag(post.video_url(:screenshot), size: '100x75') : 'No video')
      f.input :subtitle, as: :file, hint: (f.object.subtitle_url ? content_tag(:span, "Current File Name: #{f.object.subtitle.metadata['filename']}") : content_tag(:span, 'No subtitle'))
    end
    f.actions
  end

  # controller do
  #   cache_sweeper :post_sweeper
  # end
end
