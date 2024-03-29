ActiveAdmin.register Translation do
  permit_params :title, :post_id, :language, :audio
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
      row :title
      row :language
      row :updated_at
      row :audio do |translation|
        translation.audio_url ? audio_tag(translation.audio_url, controls: true) : content_tag(:span, 'No Audio')
      end
    end
  end

  form do |f|
    f.inputs 'Translation', multipart: true do
      f.input :title
      f.input :language, collection: Settings.languages
      if f.object.id
        f.input :audio, as: :file, hint: (f.object.audio_url ? content_tag(:span, "Current File Name: #{f.object.audio.metadata['filename']}") : content_tag(:span, 'No audio'))
      end
    end
    f.actions
  end

  # controller do
  #   cache_sweeper :post_sweeper
  # end
end
