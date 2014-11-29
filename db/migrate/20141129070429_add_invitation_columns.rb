class AddInvitationColumns < ActiveRecord::Migration
  def change
    change_table :participations do |t|
      t.string :token
      t.boolean :confirmed, default: false
    end
  end
end
