class Tandems < ActiveRecord::Migration
  def change
    create_table :tandems do |t|
      t.string :place
      t.date :schedule
    end

    create_table :participations do |t|
      t.references :user
      t.string :language
      t.references :tandem
    end
  end
end
