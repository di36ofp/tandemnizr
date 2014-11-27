class CreateTandems < ActiveRecord::Migration
  def change
    create_table :tandems do |t|

      t.timestamps
    end
  end
end
