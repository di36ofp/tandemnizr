class UpdateTandems < ActiveRecord::Migration
  def change
    rename_column :tandems, :current_user_id, :user_id
  end
end
