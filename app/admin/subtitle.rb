ActiveAdmin.register Subtitle do
  permit_params :post_id, :language, :subtitle
  belongs_to :post

  index do
    selectable_column
    column :id
    column :language
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Subtitle', multipart: true do
      f.input :language, collection: Settings.languages
      if f.object.id
        f.input :subtitle, as: :file, hint: (f.object.subtitle_url ? content_tag(:span, "Current File Name: #{f.object.subtitle.metadata['filename']}") : content_tag(:span, 'No subtitle'))
      end
    end
    f.actions
  end

end
