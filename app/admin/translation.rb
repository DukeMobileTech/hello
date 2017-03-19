ActiveAdmin.register Translation do
  belongs_to :post
  permit_params :title, :post_id, :language, :audio

  form do |f|
    f.inputs 'Translation', multipart: true do
      f.input :title, label: 'Title'
      f.input :language, label: 'Audio Language', collection: LanguageList::COMMON_LANGUAGES
      f.input :audio, as: :file
    end
    f.actions
  end
end
