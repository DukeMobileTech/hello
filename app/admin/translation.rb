ActiveAdmin.register Translation do
  permit_params :title, :post_id, :language, :audio
  belongs_to :post

  index do
    selectable_column
    column :id
    column :title
    column :language do |translation|
      translation.language.split(' ').last
    end
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :language
      row :updated_at
      row :audio_updated_at
      row :audio do |translation|
        translation.audio ? audio_tag(translation.audio.url, controls: true) : content_tag(:span, 'No Audio')
      end
    end
  end

  form do |f|
    f.inputs 'Translation', multipart: true do
      f.input :title, label: 'Title'
      f.input :language, label: 'Audio Language', collection: LanguageList::COMMON_LANGUAGES
      f.input :audio, as: :file
    end
    f.actions
  end
end
