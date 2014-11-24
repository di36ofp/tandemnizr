class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :nationality
      t.string :city
      t.integer :cp
      t.integer :age
      t.string :career
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
