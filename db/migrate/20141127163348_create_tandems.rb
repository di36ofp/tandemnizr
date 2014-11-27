class CreateTandems < ActiveRecord::Migration
  def change
    create_table :tandems do |t|
      t.integer :current_user_id
      t.integer :mate_id
      t.string :language
      t.boolean :confirmation
      t.timestamps
    end
  end
end
