class DeviseInvitableAddToAdminUsers < ActiveRecord::Migration
  def up
    change_table :admin_users do |t|
      # Add names
      t.string :first_name
      t.string :last_name
      # Add devise modules attributes
      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at
      ## Indices
      add_index :admin_users, :confirmation_token,   unique: true
      add_index :admin_users, :unlock_token,         unique: true
      # Add invitable attributes
      t.string     :invitation_token
      t.datetime   :invitation_created_at
      t.datetime   :invitation_sent_at
      t.datetime   :invitation_accepted_at
      t.integer    :invitation_limit
      t.references :invited_by, polymorphic: true
      t.integer    :invitations_count, default: 0
      t.index      :invitations_count
      t.index      :invitation_token, unique: true # for invitable
      t.index      :invited_by_id
    end
  end

  def down
    change_table :admin_users do |t|
      t.remove_references :invited_by, polymorphic: true
      t.remove :invitations_count, :invitation_limit, :invitation_sent_at, :invitation_accepted_at, :invitation_token, :invitation_created_at, :confirmation_token, :confirmed_at, :confirmation_sent_at, :failed_attempts, :unlock_token, :locked_at, :first_name, :last_name
    end
  end
end
