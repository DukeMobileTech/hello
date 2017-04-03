ActiveAdmin.register Transcript do
  permit_params :title, :post_id, :language, :text
  belongs_to :post

  index do
    selectable_column
    column :id
    column :title
    column :language
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Transcript', multipart: true do
      f.input :title
      f.input :language, collection: LanguageList::ALL_LANGUAGES.map(&:name).sort
      f.input :text
    end
    f.actions
  end
end
