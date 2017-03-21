ActiveAdmin.register AdminUser do
  permit_params :email, :first_name, :last_name, :password, :password_confirmation
  actions :all, except: :new

  action_item :new_invitation, only: :index do
    link_to 'Invite New Admin User', new_invitation_admin_admin_users_path
  end

  collection_action :new_invitation do
    @user = AdminUser.new
    render '_new_invitation', layout: 'active_admin'
  end

  collection_action :send_invitation, method: :post do
    @user = AdminUser.invite!(admin_user_params, current_admin_user)
    if @user.errors.empty?
      flash[:success] = 'AdminUser has been successfully invited.'
      redirect_to admin_admin_users_path
    else
      messages = @user.errors.full_messages.map { |msg| msg }.join
      flash[:error] = 'Error: ' + messages
      redirect_to new_invitation_admin_admin_users_path
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :fullname
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update
      user = AdminUser.find(params[:id])
      if params[:admin_user].blank? || params[:password].blank? || params[:password_confirmation].blank?
        user.update_without_password(admin_user_params)
      else
        user.update_attributes(admin_user_params)
      end
      if user.errors.blank?
        redirect_to admin_admin_user_path(params[:id]), notice: 'User updated successfully.'
      else
        render :edit
      end
    end

    private

    def admin_user_params
      params.require(:admin_user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
    end
  end
end
