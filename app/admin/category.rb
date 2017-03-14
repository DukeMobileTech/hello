ActiveAdmin.register Category do
  permit_params :name, :pictogram

  form do |f|
    f.inputs 'Category Details' do
      f.input :name, label: 'Name'
      f.input :pictogram, as: :file
    end
    f.actions
  end
end
